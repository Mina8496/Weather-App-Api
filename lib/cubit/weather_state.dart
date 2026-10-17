abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String error;

  WeatherFailureState({required this.error});
}
