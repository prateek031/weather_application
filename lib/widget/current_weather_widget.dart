// ignore_for_file: prefer_const_constructors

import "package:final_weather_app/models/weather_data_current.dart";
import "package:flutter/material.dart";
import "package:final_weather_app/utils/custom_colors.dart";

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({
    super.key,
    required this.weatherDataCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempreatureAreaWidget(),

        SizedBox(
          height: 20,
        ),
        currentWeatherMoreDetailWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColrs.cardColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset("assets/weather/172922.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColrs.cardColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset("assets/weather/252035.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColrs.cardColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset("assets/weather/728093.png"),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.windSpeed}km/h",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,),
            ),
             SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.clouds}%",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,),
            ),
             SizedBox(
              height: 20,
              width: 60,
              child: Text("${weatherDataCurrent.current.humidity}%",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,),
            )
          ],
        )
      ],
    );
  }

  Widget tempreatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColrs.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${weatherDataCurrent.current.temp!.toInt()}°C",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: CustomColrs.textColorBlack,
              )),
          TextSpan(
              text: "${weatherDataCurrent.current.weather![0].description}",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.grey,
              ))
        ]))
      ],
    );
  }
}
