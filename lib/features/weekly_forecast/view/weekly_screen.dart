import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/features/weekly_forecast/widgets/weekly_tile.dart';
import 'package:weather_app/ui/theme/theme.dart';

class WeatherSecondScreen extends StatefulWidget {
  const WeatherSecondScreen({super.key});

  @override
  State<WeatherSecondScreen> createState() => _WeatherSecondScreenState();
}

class _WeatherSecondScreenState extends State<WeatherSecondScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context)
        .add(WeatherFetch(cityName: '', completer: Completer()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Scaffold(
          backgroundColor: Colors.blue[400],
          appBar: AppBar(
            backgroundColor: Colors.blue[400],
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Погода на 5 дней',
              style: themeData.textTheme.displayMedium,
            ),
          ),
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoaded) {
                return ListView.builder(
                  itemCount: state.weatherModel.forecast.length,
                  itemBuilder: (context, index) {
                    final day = state.weatherModel.forecast[index];
                    final date = DateTime.now().add(Duration(days: index));
                    const weekDays = [
                      'Понедельник',
                      'Вторник',
                      'Среда',
                      'Четверг',
                      'Пятница',
                      'Суббота',
                      'Воскресенье'
                    ];
                    final weekDay = weekDays[date.weekday - 1];
                    return Container(
                      color: Colors.transparent,
                      child: WeatherTile(
                          day: day,
                          weekDay: weekDay,
                          weatherModel: state.weatherModel),
                    );
                  },
                );
              }
              if (state is WeatherError) {
                return const Center(
                  child: Text('Упс, ошибка!'),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
