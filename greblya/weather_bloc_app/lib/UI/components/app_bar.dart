import 'package:flutter/material.dart';
import 'package:weather_bloc_app/UI/utils/color.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, String title, dynamic scaffoldKey) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
    child: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Align(
                    child: Text(
                  title,
                  style: TextStyle(
                      color: appBarTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: dividerColor,
          ),
        ],
      ),
    ),
  );
}
