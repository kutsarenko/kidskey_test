import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_states.dart';
import 'package:weather_bloc_app/components/app_bar.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  final GlobalKey _scaffoldKey = GlobalKey();

  final String _currentDate = DateFormat.EEEE().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherIsEmptyState) {
        return Container(
          child: Center(
            child: Text('Push the button "Get weather"'),
          ),
        );
      }
      if (state is WeatherIsLoadingState) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is WeatherIsFetchedState) {
        return Scaffold(
          appBar: customAppBar(context, _currentDate, _scaffoldKey),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.cloud),
              ),
              Text(state.location.toString().toUpperCase()),
              Text(state.weather.mainPointers.temp.toString() +
                  ' °' +
                  ' | ' +
                  state.weather.description[0].mainDescription),
              Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.blue),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.ac_unit),
                        Text(state.weather.mainPointers.humidity.toString() +
                            '%')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.pin_drop),
                        Text(state.weather.visibility.toString() + ' mm')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.thermostat_outlined),
                        Text(state.weather.mainPointers.pressure.toString() +
                            ' hPa')
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.directions),
                        Text(state.weather.windModel.speed.toString() + ' km/h')
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Column(
                  //     children: [
                  //       Icon(Icons.play_circle_outline_outlined),
                  //       Text('${_windDirection.toString()}')
                  //     ],
                  //   ),
                  // )
                ],
              ),
              Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.blue),
              GestureDetector(
                child: Text('Share'),
              )
            ],
          ),
        );
      }
      if (state is WeatherErrorFetchState) {
        return Text('Fatal Error');
      }
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
