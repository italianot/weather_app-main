import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';
import 'package:weather_app/data_sources/local/weather_local_data_source.dart';
import 'package:weather_app/models/global.dart';
import 'package:weather_app/repository/weather_repository.dart';

import 'my_home_page.dart';

class FiveDays extends StatefulWidget {
  const FiveDays({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FiveDays> createState() => _FiveDaysState();
}

class _FiveDaysState extends State<FiveDays> {
  Future<WeatherRepository> initRepository() async {
    final api = WeatherApi();
    final localDataSource = WeatherLocalDataSource();
    await localDataSource.init();
    return WeatherRepository(api, localDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<WeatherRepository>(
              future: initRepository(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                final repo = snapshot.data!;
                return FutureBuilder<Global>(
                  future: repo.fetchData(
                      52.27483630743035, 104.25449925002037, 5), /////////////
                  builder: (context, AsyncSnapshot<Global> data) {
                    if (data.hasData && data.data != null) {
                      ListView.builder(
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.data!.name,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    'Температура: ${data.data!.main.temp.toString()}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'Ощущается как: ${data.data!.main.feelsLike.toString()}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    '${data.data!.weather[0]}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ]),
                          ),
                        );
                      }));
                    } else if (data.hasError) {
                      return Text(
                        'ошибка',
                        style: TextStyle(fontSize: 30),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
