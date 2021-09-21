import 'package:weather_bloc_app/models/main_model.dart';
import 'package:weather_bloc_app/models/weather_description_model.dart';
import 'package:weather_bloc_app/models/wind.dart';

class WeatherModel {
  final MainPointers mainPointers;
  final List<WeatherDescription> description;
  final WindModel windModel;
  final int visibility;

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
        mainPointers: MainPointers.fromJson(json['main']),
        description: descriptionList,
        windModel: WindModel.fromJson(json['wind']),
        visibility: json['visibility']);
  }
}
