import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_events.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_states.dart';
import 'package:weather_bloc_app/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepository = WeatherRepo();
  WeatherBloc(this.weatherRepository) : super(WeatherIsLoadingState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherLoadEvent) {
      yield WeatherIsLoadingState();
      try {
        final loadedWeather = await weatherRepository.getFullWeather();
        Future.delayed(Duration(seconds: 1));
        final currentLocation = await weatherRepository.getAddress();
        yield WeatherIsFetchedState(
            weather: loadedWeather, location: currentLocation);
        print(loadedWeather);
      } catch (_) {
        print(_);
        WeatherErrorFetchState();
      }
    }
  }
}
