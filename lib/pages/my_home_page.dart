import 'package:flutter/material.dart';
import 'package:weather_app/data_sources/api/weather_api.dart';
import 'package:weather_app/data_sources/local/weather_local_data_source.dart';
import 'package:weather_app/models/global.dart';
import 'package:weather_app/repository/weather_repository.dart';

import 'five_days.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const FiveDays(title: 'Прогноз на 5 дней',))));
                },
                child: Text('Прогноз на 5 дней')),
          ),
          Center(
            child: FutureBuilder<WeatherRepository>(
              future: initRepository(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                final repo = snapshot.data!;
                return FutureBuilder<Global>(
                  future: repo.fetchData(
                      52.2978, 104.296, 1), /////////////
                  builder: (context, AsyncSnapshot<Global> data) {
                    if (data.hasData && data.data != null) {
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
                                  '${data.data!.weather[0].main} ${data.data!.weather[0].description}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ]),
                        ),
                      );
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
