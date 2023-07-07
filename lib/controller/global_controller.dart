import 'package:final_weather_app/models/weather_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:final_weather_app/api/fetch_weather.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _isLatitude = 0.0.obs;
  final RxDouble _isLongitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _isLatitude;
  RxDouble getLongitude() => _isLongitude;

  final weatherData = WeatherData().obs;
  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("location is not enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("location permission are denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission == await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("location permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _isLatitude.value = value.latitude;
      _isLongitude.value = value.longitude;

      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });

      // print(_isLatitude.value);
      // print(_isLongitude.value);
    });
  }
}
