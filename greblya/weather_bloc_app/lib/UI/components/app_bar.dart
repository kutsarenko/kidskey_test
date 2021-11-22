import 'package:flutter/material.dart';
import 'package:weather_bloc_app/UI/utils/color.dart';

PreferredSizeWidget customAppBar(
    bool isDetailed, BuildContext context, String title, dynamic scaffoldKey) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
    child: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              if (isDetailed == true)
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
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
