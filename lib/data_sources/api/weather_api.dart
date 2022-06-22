import 'package:dio/dio.dart';
import 'package:weather_app/models/global.dart';

class WeatherApi {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/', 
      queryParameters: {'appid': 'aba15956c1b0894dd6c841fd1e154d45'},
    ),
  );

  Future<Global> getCurrentWeather(
    double latitude,
    double longitude, int count,
  ) async {
    final response = await dio.get(
      'weather',
      queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'cnt': count,
      },
    );
    return Global.fromJson(response.data as Map<String, dynamic>);
  }
}

//https://api.openweathermap.org/data/2.5/weather?lat=52.27483630743035&lon=104.25449925002037&appid=aba15956c1b0894dd6c841fd1e154d45
