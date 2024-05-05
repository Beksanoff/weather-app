import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'package:weather_app/repositories/models/weather_model.dart';
import 'package:weather_app/repositories/weather_app/interface_weather_repository.dart';
import 'package:weather_app/ui/ui.dart';
import 'home_screen_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel? _weatherModel;
  final _getWeatherBloc = HomeScreenBloc(
    GetIt.I<InterfaceWeatherRepository>(),
  );

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    String cityName =
        await GetIt.I<InterfaceWeatherRepository>().getCurrentCity();
    try {
      _getWeatherBloc.add(HomeGetWeatherEvent(cityName: cityName));
      setState(() {});
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
        body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          bloc: _getWeatherBloc,
          builder: (context, state) {
            if (state is HomeScreenLoading) {
              return const LoadingIndicator();
            } else if (state is HomeScreenLoaded) {
              return HomeScreenInfo(weatherModel: state.weatherModel);
            }
            return const SizedBox(
              width: double.infinity,
              child: LoadingIndicator(),
            );
          },
        ));
  }
}
