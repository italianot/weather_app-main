// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Global _$GlobalFromJson(Map<String, dynamic> json) => Global(
      name: json['name'] as String,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: MainInfo.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GlobalToJson(Global instance) => <String, dynamic>{
      'name': instance.name,
      'weather': instance.weather,
      'main': instance.main,
    };
