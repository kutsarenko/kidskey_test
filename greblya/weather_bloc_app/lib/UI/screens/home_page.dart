import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/UI/screens/start_screen.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_events.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(WeatherLoadEvent());
    return Scaffold(
      body: StartScreen(),
    );
  }
}
