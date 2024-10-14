import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubites/get_currentWeather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubites/get_currentWeather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/search_view.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeaterCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeaterCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(color:Color.fromARGB(50,40,50, 50) ),
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeaterCubit>(context)
                        .weathermodel
                        ?.wheatherStatus,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              routes: {
                HomeView.routeName:(context)=>HomeView(),
                SearchView.routeName:(context)=>SearchView(),
              },
              initialRoute: HomeView.routeName,
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Clear':
      return Colors.blueGrey;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.teal;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Torrential rain shower':
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Blizzard':
      return Colors.blue;
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
