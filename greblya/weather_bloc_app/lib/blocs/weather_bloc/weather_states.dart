abstract class WeatherState {}

class WeatherIsEmptyState extends WeatherState {}

class WeatherIsLoadingState extends WeatherState {}

class WeatherIsFetchedState extends WeatherState {
  final weather;

  WeatherIsFetchedState({required this.weather});
}

class WeatherErrorFetchState extends WeatherState {}
