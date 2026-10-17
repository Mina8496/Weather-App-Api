import 'package:weather_app_api/Models/WeatherModel.dart';

abstract class WeatherState {}

class WeatherinitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String error;

  WeatherFailureState({required this.error});
}
