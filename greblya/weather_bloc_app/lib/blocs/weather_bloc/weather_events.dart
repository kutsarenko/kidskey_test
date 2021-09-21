abstract class WeatherEvent {}

class WeatherLoadEvent extends WeatherEvent {
  final _location;

  WeatherLoadEvent(this._location);
}
