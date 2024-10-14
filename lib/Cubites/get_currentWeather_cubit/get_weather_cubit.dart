import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubites/get_currentWeather_cubit/get_weather_state.dart';
import 'package:weather_app/models/wheather_model.dart';
import 'package:weather_app/services/weather_service.dart';


class GetWeaterCubit extends Cubit<WeatherState> {
  GetWeaterCubit() : super(WeatherIntialState());
  wheatherModel? weathermodel;

  getWeather({required String cityName}) async {
    try {
      weathermodel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weathermodel!));
    } catch (e) {
      emit(WeatherFailurState(e.toString()));
    }
  }
}
