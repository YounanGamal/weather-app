import 'package:flutter/material.dart';

class wheatherModel {
  final String cityName;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String? image;
  final DateTime date;
  final String wheatherStatus;

  wheatherModel(
      {required this.cityName,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.image,    
      required this.date,
      required this.wheatherStatus});

  factory wheatherModel.fromJson(json) {
    return wheatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      wheatherStatus: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
