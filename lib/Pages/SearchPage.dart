import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/Models/WeatherModel.dart';
import 'package:weather_app_api/Servers/WeatherServises.dart';
import 'package:weather_app_api/providers/Weather_provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? CityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;
              WeatherServises servises = WeatherServises();
              WeatherModel? weather =
                  await servises.getWeatherServises(CityName!);
              Provider.of<WeatherProvider>(context, listen: false).WeatherData =
                  weather;
              Navigator.pop(context);
              print(weather);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                hintText: "Enter a city",
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherServises servises = WeatherServises();
                      WeatherModel? weather =
                          await servises.getWeatherServises(CityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .WeatherData = weather;
                      Navigator.pop(context);
                      print(weather);
                    },
                    child: Icon(Icons.search)),
                label: Text("Search"),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
