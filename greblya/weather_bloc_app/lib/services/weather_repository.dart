import 'package:weather_bloc_app/models/weather_model.dart';
import 'package:weather_bloc_app/services/weather_model_api_provider.dart';

class WeatherRepo {
  String _location = '';
  WeatherModelProvider _weatherProvider = WeatherModelProvider();
  Future<WeatherModel> getFullWeather() =>
      _weatherProvider.getweather(_location);
}
