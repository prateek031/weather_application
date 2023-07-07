// ignore_for_file: prefer_const_constructors

import 'package:final_weather_app/widget/current_weather_widget.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import "package:final_weather_app/controller/global_controller.dart";
import 'package:final_weather_app/widget/header_widget.dart';
// import 'package:final_weather_app/models/weather_data.dart';
import 'package:final_weather_app/widget/hourly_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const HeaderWidget(),
                  CurrentWeatherWidget(
                    weatherDataCurrent: globalController.getData().getCurrentWeather(),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  HourlyWeatherWidget(weatherDataHourly: globalController.getData().getHourlyWeather()),
                ],
              ),
            )),
      ),
    );
  }
}
