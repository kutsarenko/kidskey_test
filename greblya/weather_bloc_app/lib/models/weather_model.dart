import 'package:weather_bloc_app/models/main_model.dart';
import 'package:weather_bloc_app/models/weather_description_model.dart';
import 'package:weather_bloc_app/models/wind.dart';

class WeatherModel {
  final Main mainPointers;
  final List<WeatherDescription> description;
  final Wind windModel;
  final num visibility;

  WeatherModel(
      {required this.mainPointers,
      required this.description,
      required this.windModel,
      required this.visibility});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var list = json['weather'] as List;
    List<WeatherDescription> descriptionList =
        list.map((e) => WeatherDescription.fromJson(e)).toList();

    return WeatherModel(
        mainPointers: Main.fromJson(json['main']),
        description: descriptionList,
        windModel: Wind.fromJson(json['wind']),
        visibility: json['visibility']);
  }
}
