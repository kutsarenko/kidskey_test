import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_bloc_app/models/weather_model.dart';
import 'package:weather_bloc_app/services/weather_model_api_provider.dart';

class WeatherRepo {
  Future<String> getAddress() async {
    var _latitudeCor;
    var _longitude;
    GeoCode geoCode = GeoCode();
    Future.delayed(Duration(seconds: 2));
    Position? position = await Geolocator.getCurrentPosition();
    _latitudeCor = position.latitude;
    _longitude = position.longitude;

    final coordinates = await geoCode.reverseGeocoding(
        latitude: _latitudeCor!, longitude: _longitude!);
    String _location = coordinates.city.toString();
    return _location;
  }

  WeatherModelProvider _weatherProvider = WeatherModelProvider();

  Future<WeatherModel> getFullWeather() async {
    return _weatherProvider.getweather(await getAddress());
  }
}
