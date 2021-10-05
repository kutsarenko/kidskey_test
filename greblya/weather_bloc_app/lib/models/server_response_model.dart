import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc_app/models/city_model.dart';
import 'package:weather_bloc_app/models/weather_data.dart';

part 'server_response_model.g.dart';

@JsonSerializable()
class ServerResponse {
  List<WeatherData>? list;
  City? city;

  ServerResponse({this.list, this.city});

  factory ServerResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);
}
