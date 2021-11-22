import 'package:flutter/material.dart';
import 'package:weather_bloc_app/UI/components/app_bar.dart';
import 'package:weather_bloc_app/UI/utils/converter.dart';
import 'package:weather_bloc_app/models/city_model.dart';
import 'package:weather_bloc_app/models/weather_data.dart';

class DetailedScreen extends StatefulWidget {
  final String? title;
  final City? city;
  final WeatherData? weather;
  const DetailedScreen({this.title, this.city, this.weather});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  final GlobalKey _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(true, context, widget.title!, _scaffoldKey),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.cloud),
          ),
          Text('${widget.city!.name}, ${widget.city!.country}'),
          Center(
            child: Text((ConvertWeather.convertToCelcium(
                            widget.weather!.mainPointers!.temp!)
                        .roundToDouble())
                    .toString() +
                ' °' +
                ' | ' +
                '${widget.weather!.description!.first.description}'),
          ),
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
                    Text('state.weather.mainPointers.humidity.toString()' + '%')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.pin_drop),
                    Text('state.weather.visibility.toString()' + ' mm')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.thermostat_outlined),
                    Text('state.weather.mainPointers.pressure.toString()' +
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
                    Text('state.weather.windModel.speed.toString()' + ' km/h')
                  ],
                ),
              ),
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
}
