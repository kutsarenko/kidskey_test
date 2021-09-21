import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_bloc_app/bloc/weather_bloc.dart';
import 'package:weather_bloc_app/bloc/weather_states.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  // String _currentLocation = '';

  // Future<String> getAddress() async {
  //   var _latitudeCor;
  //   var _longitude;
  //   GeoCode geoCode = GeoCode();
  //   Position? position = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     _latitudeCor = position.latitude;
  //     _longitude = position.longitude;
  //   });
  //   final coordinates = await geoCode.reverseGeocoding(
  //       latitude: _latitudeCor!, longitude: _longitude!);
  //   setState(() {
  //     _currentLocation = coordinates.city.toString();
  //   });
  //   print('curLoc - $_currentLocation');
  //   return _currentLocation;
  // }

  // @override
  // void initState() {
  //   getAddress();
  //   super.initState();
  // }

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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(Icons.cloud),
            ),
            Text('Gomel'),
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
                      Text(state.weather.mainPointers.humidity.toString() + '%')
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
