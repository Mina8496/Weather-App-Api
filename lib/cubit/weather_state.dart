abstract class WeatherState {}

class WeatherinitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String error;

  WeatherFailureState({required this.error});
}
