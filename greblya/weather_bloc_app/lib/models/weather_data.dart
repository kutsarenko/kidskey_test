import 'package:weather_bloc_app/models/clouds_model.dart';
import 'package:weather_bloc_app/models/main_model.dart';
import 'package:weather_bloc_app/models/weather_description_model.dart';
import 'package:weather_bloc_app/models/wind_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  Main? mainPointers;
  List<WeatherDescription>? description;
  Wind? wind;
  num? visibility;
  Clouds? clouds;
  String? dateTime;

  WeatherData(
      {this.mainPointers,
      this.description,
      this.wind,
      this.visibility,
      this.clouds,
      this.dateTime});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
