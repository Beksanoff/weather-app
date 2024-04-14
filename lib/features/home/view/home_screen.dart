import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/repositories/weather_app/weather_app_repository.dart';
import 'package:weather_app/ui/theme/theme.dart';
import 'package:weather_app/ui/ui.dart';
import '../widgets/greeting_message.dart';
import 'home_screen_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel? _weatherModel;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    String cityName = await WeatherService().getCurrentCity();

    try {
      final weatherModel = await WeatherService().getWeather(cityName);
      setState(() {
        _weatherModel = weatherModel;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          greetingMessage(),
          style: themeData.textTheme.displayMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: _weatherModel == null
            ? const LoadingIndicator()
            : HomeScreenInfo(weatherModel: _weatherModel),
      ),
    );
  }
}
