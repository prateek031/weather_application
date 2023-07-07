// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_weather_app/models/weather_data_hourly.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:final_weather_app/utils/custom_colors.dart';
import 'package:intl/intl.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;

  const HourlyWeatherWidget({super.key, required this.weatherDataHourly});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: Text(
            "Today",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Container(
                width: 90,
                margin: EdgeInsets.only(left: 20, right: 5),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: CustomColrs.dividerLine.withAlpha(150))
                ],
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 135, 221, 255),
                  Color.fromARGB(255, 87, 201, 253)
                ])),
            child: HourlyDetails(
                temp: weatherDataHourly.hourly[index].temp!,
                timeStamp: weatherDataHourly.hourly[index].dt!,
                weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!),
          ));
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat("jm").format(time);
    return x;
  }

  HourlyDetails({
    super.key,
    required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp)),
        ),
        Container(
          margin: EdgeInsets.all(6),
          child: Image.asset("assets/weather/$weatherIcon.png",
          height: 40,
          width: 40,),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text("$temp°c"),
        )
        ],
    );
  }
}
