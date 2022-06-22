import 'package:weather_app/data_sources/api/weather_api.dart';
import 'package:weather_app/data_sources/local/weather_local_data_source.dart';
import 'package:weather_app/models/global.dart';

class WeatherRepository { 
  final WeatherApi api;
  final WeatherLocalDataSource localDataSource;

  WeatherRepository(this.api, this.localDataSource);

  Future<Global> fetchData(double latitude, double longitude, int count) async {
    final localGlobal = localDataSource.get();
    if (localGlobal == null) {
      final _global = await api.getCurrentWeather(latitude, longitude, count);
      await localDataSource.set(_global);
      return _global;
    } else {
      return localGlobal;
    }
  }
}
