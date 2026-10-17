import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_api/Pages/HomePage.dart';
import 'package:weather_app_api/Servers/WeatherServises.dart';
import 'package:weather_app_api/cubit/weather_cubit.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServises());
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
          // primarySwatch:
          //     Provider.of<WeatherProvider>(context).WeatherData == null
          //         ? Colors.blue
          //         : Provider.of<WeatherProvider>(context)
          //             .WeatherData!
          //             .getThemeColor()
          ),
      home: HomePage(),
    );
  }
}
