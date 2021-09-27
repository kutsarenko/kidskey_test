abstract class WeatherState {}

class WeatherIsEmptyState extends WeatherState {}

class WeatherIsLoadingState extends WeatherState {}

class WeatherIsFetchedState extends WeatherState {
  final weather;
  final location;

  WeatherIsFetchedState({required this.weather, required this.location});
}

class WeatherErrorFetchState extends WeatherState {}
