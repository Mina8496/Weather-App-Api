import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/Models/WeatherModel.dart';
import 'package:weather_app_api/Servers/WeatherServises.dart';
import 'package:weather_app_api/cubit/weather_cubit.dart';
import 'package:weather_app_api/providers/Weather_provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;

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
              cityName = data;
            },
            onSubmitted: (data) async {
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                hintText: "Enter a city",
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherServises servises = WeatherServises();
                      WeatherModel? weather = await servises.getWeatherServises(
                          cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .WeatherData = weather;
                      Navigator.pop(context);
                      print(weather);
                    },
                    child: const Icon(Icons.search)),
                label: const Text("Search"),
                border: const OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
