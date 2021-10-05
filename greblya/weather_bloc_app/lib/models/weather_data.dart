import 'package:weather_bloc_app/models/clouds.dart';
import 'package:weather_bloc_app/models/main_model.dart';
import 'package:weather_bloc_app/models/wind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  Main? mainPointers;
  Wind? windMod;
  num? visibility;
  Clouds? clouds;
  String? dateTime;

  WeatherData(
      {this.mainPointers,
      this.windMod,
      this.visibility,
      this.clouds,
      this.dateTime});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
