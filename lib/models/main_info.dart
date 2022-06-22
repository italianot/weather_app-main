import 'package:json_annotation/json_annotation.dart';

part 'main_info.g.dart';

@JsonSerializable()
class MainInfo {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;

  MainInfo({
    required this.temp,
    required this.feelsLike,
  });

  factory MainInfo.fromJson(Map<String, dynamic> json) => _$MainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}
