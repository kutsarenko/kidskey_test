import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_bloc_app/UI/utils/color.dart';

class RowWeather extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final String? time;
  final String? description;
  final num? temp;
  RowWeather({this.onTap, this.icon, this.time, this.description, this.temp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(icon, size: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(time!),
                  Expanded(
                    child: Text(
                      description!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Row(
              children: [
                Text(
                  temp.toString(),
                  style: TextStyle(
                    color: degreeColor,
                    fontSize: 50,
                  ),
                ),
                Text(
                  '°',
                  style: TextStyle(
                    color: degreeColor,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
