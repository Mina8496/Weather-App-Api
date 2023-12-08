import 'package:flutter/material.dart';
import 'package:weather_app_api/Models/WeatherModel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _WeatherData;

  set WeatherData(WeatherModel? weather) {
    _WeatherData = weather;
    notifyListeners();
  }

  WeatherModel? get WeatherData => _WeatherData;
}
