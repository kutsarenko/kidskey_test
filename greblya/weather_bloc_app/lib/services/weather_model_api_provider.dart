import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_bloc_app/models/server_response_model.dart';

class WeatherModelProvider {
  // http://api.openweathermap.org/data/2.5/weather?q=homel&appid=2944bef026a0e62f932b946713012b48

  Future<ServerResponse> getweather(String _location) async {
    final response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?q=$_location&appid=2944bef026a0e62f932b946713012b48'),
    );
    if (response.statusCode == 200) {
      final ServerResponse weatherJson =
          ServerResponse.fromJson(json.decode(response.body));
      return weatherJson;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
