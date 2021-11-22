import 'package:json_annotation/json_annotation.dart';

part 'weather_description_model.g.dart';

@JsonSerializable()
class WeatherDescription {
  String? main;
  String? description;

  WeatherDescription({this.main, this.description});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}
