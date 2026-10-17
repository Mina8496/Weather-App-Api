import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_api/Models/WeatherModel.dart';
import 'package:weather_app_api/Pages/SearchPage.dart';
import 'package:weather_app_api/cubit/weather_cubit.dart';
import 'package:weather_app_api/cubit/weather_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final WeatherModel? weatherData = state is WeatherSuccessState
            ? state.weatherModel
            : null;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: weatherData?.getThemeColor() ?? Colors.blue,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SearchPage()),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
            title: const Text('Weather App'),
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(WeatherState state) {
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessState) {
            return ShowWeatherData(weatherData: state.weatherModel);
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text('somethng went wrong please try again'),
            );
          } else {
            return const DeafultShowWeather();
          }
  }
}

class DeafultShowWeather extends StatelessWidget {
  const DeafultShowWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowWeatherData extends StatelessWidget {
  final WeatherModel weatherData;

  const ShowWeatherData({
    required this.weatherData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData.getThemeColor(),
        weatherData.getThemeColor()[300]!,
        weatherData.getThemeColor()[100]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
          const SizedBox(
            height: 110,
          ),
          Text(
            weatherData.CityName,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            weatherData.Date,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.network("https:${weatherData.Icon}")),
              Text(
                weatherData.Temp.toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text(
                    weatherData.MaxTemp.toString(),
                    style: const TextStyle(fontSize: 23),
                  ),
                  Text(
                    weatherData.MinTemp.toString(),
                    style: const TextStyle(fontSize: 23),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Text(
              weatherData.WeatherState,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
