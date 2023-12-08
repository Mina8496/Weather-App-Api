import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:weather_app_api/Models/WeatherModel.dart';

class WeatherServises {
  String baseUrl = "http://api.weatherapi.com/v1";
  String APIKey = "2a77082ed8f049058b8224212232501";

  get context => null;
  Future<WeatherModel?> getWeatherServises(String CityName) async {
    try {
      Uri Url =
          Uri.parse("$baseUrl/forecast.json?key=$APIKey&q=$CityName&days=1");
      http.Response response = await http.get(Url);
      Map<String, dynamic> data = jsonDecode(response.body);

      WeatherModel weather = WeatherModel.fromJson(data);
      return weather;
    } catch (e) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Wrong Name City",
        desc: "check the name and try again.",
        buttons: [
          DialogButton(
            child: Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
  }
}
