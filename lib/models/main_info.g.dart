// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainInfo _$MainInfoFromJson(Map<String, dynamic> json) => MainInfo(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$MainInfoToJson(MainInfo instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
    };
