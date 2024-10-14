import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/wheather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'a9897bab1c4a4fa585d195221242807';

  WeatherService(this.dio);

  Future<wheatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      wheatherModel weathermodel = wheatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops ,there was an error. please, try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops ,there was an error.try later');
    }
  }
}
