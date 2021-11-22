import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc_app/UI/components/app_bar.dart';
import 'package:weather_bloc_app/UI/components/row_with_weeather.dart';
import 'package:weather_bloc_app/UI/screens/detailed_screen.dart';
import 'package:weather_bloc_app/UI/utils/converter.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_bloc_app/blocs/weather_bloc/weather_states.dart';
import 'package:weather_bloc_app/models/server_response_model.dart';
import 'package:weather_bloc_app/models/weather_data.dart';
import 'package:intl/date_symbol_data_local.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_US');
    GlobalKey _scaffoldKey = GlobalKey();
    List<DateTime> dayList = List<DateTime>.generate(
      5,
      (index) => DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).add(
        Duration(days: index),
      ),
    );

    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherIsEmptyState) {
        return Container(
          child: Center(
            child: Text('Push the button "Get weather"'),
          ),
        );
      } else if (state is WeatherErrorFetchState) {
        return Center(
          child: GestureDetector(
            child: Text('Something went wrong, please try again'),
          ),
        );
      } else if (state is WeatherIsLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WeatherIsFetchedState) {
        ServerResponse fullData = state.weather;
        List<WeatherData>? listWeather = fullData.list;
        return Scaffold(
          appBar:
              customAppBar(false, context, fullData.city!.name!, _scaffoldKey),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: dayList.length,
                itemBuilder: (context, index) {
                  List<WeatherData> singleDayweatherList = listWeather!
                      .where((element) =>
                          DateTime.parse(element.dateTime!).day ==
                          dayList[index].day)
                      .toList();
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(index == 0
                              ? 'Today'
                              : DateFormat.EEEE().format(dayList[index])),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: singleDayweatherList.length,
                          itemBuilder: (context, i) => RowWeather(
                            onTap: () {
                              Navigator.of(context)
                                  .push(CupertinoPageRoute(builder: (c) {
                                return DetailedScreen(
                                  title: index == 0
                                      ? 'Today'
                                      : DateFormat().format(dayList[index]),
                                  city: fullData.city,
                                  weather: singleDayweatherList[i],
                                );
                              }));
                            },
                            icon: Icons.ac_unit,
                            temp: ConvertWeather.convertToCelcium(
                                    singleDayweatherList[i].mainPointers!.temp!)
                                .round(),
                            time: ConvertWeather.convertTimeToString(
                                singleDayweatherList[i].dateTime!),
                            description: singleDayweatherList[i]
                                .description!
                                .first
                                .description,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        );
      } else {
        return Center(
          child: Text('Push the button "Get weather"'),
        );
      }
    });
  }
}
