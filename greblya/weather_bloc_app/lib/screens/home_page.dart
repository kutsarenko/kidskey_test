import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_events.dart';
import 'package:weather_bloc_app/components/app_bar.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc_app/components/main_body.dart';
import 'package:weather_bloc_app/utils/color.dart';
import 'package:weather_bloc_app/utils/size.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _scaffoldKey = GlobalKey();

  final String _currentDate = DateFormat.EEEE().format(DateTime.now());

  // String _currentLocation = '';

  // Future<String> getAddress() async {
  //   var _latitudeCor;
  //   var _longitude;
  //   GeoCode geoCode = GeoCode();
  //   Future.delayed(Duration(seconds: 2));
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
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(WeatherLoadEvent());
    return Scaffold(
      appBar: customAppBar(context, _currentDate, _scaffoldKey),
      body: MainBody(),
    );
  }
}
