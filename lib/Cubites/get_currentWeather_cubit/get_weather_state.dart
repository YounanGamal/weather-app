import 'package:weather_app/models/wheather_model.dart';

class WeatherState {}

class WeatherIntialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final wheatherModel weathermodel;

  WeatherLoadedState(this.weathermodel);
}

class WeatherFailurState extends WeatherState {
  final String errorMessage;

  WeatherFailurState(this.errorMessage);
}
