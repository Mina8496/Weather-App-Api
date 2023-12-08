import 'package:flutter/material.dart';

class WeatherModel {
  final String CityName;
  final double Temp;
  final String Date;
  final double MaxTemp;
  final double MinTemp;
  final String WeatherState;
  final String Icon;

  WeatherModel(
      {required this.CityName,
      required this.Temp,
      required this.Date,
      required this.MaxTemp,
      required this.MinTemp,
      required this.WeatherState,
      required this.Icon});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonDecode = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        CityName: data["location"]["name"],
        Temp: jsonDecode["avgtemp_c"],
        Date: data["location"]["localtime"],
        MaxTemp: jsonDecode["maxtemp_c"],
        MinTemp: jsonDecode["mintemp_c"],
        WeatherState: jsonDecode["condition"]["text"],
        Icon: jsonDecode["condition"]["icon"]);
  }
  MaterialColor getThemeColor() {
    if (WeatherState == "Clear" || WeatherState == "Light Cloud") {
      return Colors.orange;
    } else if (WeatherState == "Sleet" ||
        WeatherState == "Snow" ||
        WeatherState == "Hail") {
      return Colors.blue;
    } else if (WeatherState == "Heavy Cloud") {
      return Colors.blueGrey;
    } else if (WeatherState == "Light Rain" ||
        WeatherState == "Heavy Rain" ||
        WeatherState == "Showers") {
      return Colors.blue;
    } else if (WeatherState == "Clear" || WeatherState == "Light Cloud") {
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return "City name $CityName, temp = $Temp icon= $Icon";
  }
}
