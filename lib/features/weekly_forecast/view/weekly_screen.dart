import 'package:flutter/material.dart';

import 'package:weather_app/features/weekly_forecast/widgets/weekly_tile.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/repositories/weather_app/weather_app_repository.dart';
import 'package:weather_app/ui/theme/theme.dart';
import 'package:weather_app/ui/widgets/loading_indicator.dart';

class WeatherSecondScreen extends StatefulWidget {
  const WeatherSecondScreen({super.key});

  @override
  State<WeatherSecondScreen> createState() => _WeatherSecondScreenState();
}

class _WeatherSecondScreenState extends State<WeatherSecondScreen> {
  WeatherModel? _weatherModel;

  Future<void> _fetchWeather() async {
    String cityName = await WeatherService().getCurrentCity();

    try {
      final weatherModel = await WeatherService().getWeather(cityName);
      setState(() {
        _weatherModel = weatherModel;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
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
        body: _weatherModel == null
            ? const LoadingIndicator()
            : ListView.builder(
                itemCount: _weatherModel!.forecast.length,
                itemBuilder: (context, index) {
                  final day = _weatherModel!.forecast[index];
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
                        weatherModel: _weatherModel!),
                  );
                },
              ),
      ),
    );
  }
}
