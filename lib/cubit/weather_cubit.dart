import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_api/Models/WeatherModel.dart';
import 'package:weather_app_api/Servers/WeatherServises.dart';
import 'package:weather_app_api/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this.weatherServises,
  ) : super(WeatherinitialState());

  String? cityName;
  WeatherServises weatherServises;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
          await weatherServises.getWeatherServises(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(error: e.toString()));
    }
  }
}
