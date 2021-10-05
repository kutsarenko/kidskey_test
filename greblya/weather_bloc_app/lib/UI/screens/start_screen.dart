import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc_app/components/app_bar.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    List<String> formattedDayList = [];
    for (int i = 0; i < dayList.length; i++) {
      formattedDayList.add(DateFormat.EEEE().format(dayList[i]));
      formattedDayList.first = 'Today';
    }

    print('dayList - ${formattedDayList}');

    return Scaffold(
      appBar: customAppBar(context, 'title', _scaffoldKey),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: dayList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(formattedDayList[index]),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
