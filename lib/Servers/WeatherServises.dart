import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_api/Models/WeatherModel.dart';

class WeatherServises {
  String baseUrl = "http://api.weatherapi.com/v1";
  String APIKey = "2a77082ed8f049058b8224212232501";

  Future<WeatherModel> getWeatherServises({required String cityName}) async {
    try {
      Uri Url =
          Uri.parse("$baseUrl/forecast.json?key=$APIKey&q=$cityName&days=1");
      http.Response response = await http.get(Url);

      if (response.statusCode == 400) {
        var data = jsonDecode(response.body);
        throw Exception(data['error']['message']);
      }
      Map<String, dynamic> data = jsonDecode(response.body);

      WeatherModel weather = WeatherModel.fromJson(data);
      return weather;
    } catch (e) {
      throw Exception('Unable to get weather data: $e');
    }
  }
}
