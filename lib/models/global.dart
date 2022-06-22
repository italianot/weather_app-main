import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/main_info.dart';
import 'package:weather_app/models/weather.dart';

part 'global.g.dart'; 

@JsonSerializable()
class Global {
  final String name;
  final List<Weather> weather;
  final MainInfo main;

  Global({
    required this.name,
    required this.weather,
    required this.main,
  });

  factory Global.fromJson(Map<String, dynamic> json) => _$GlobalFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalToJson(this);
}
