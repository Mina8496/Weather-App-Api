import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/Pages/HomePage.dart';
import 'package:weather_app_api/providers/Weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).WeatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherProvider>(context)
                      .WeatherData!
                      .getThemeColor()),
      home: HomePage(),
    );
  }
}
