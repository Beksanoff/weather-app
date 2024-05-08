import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_screen_bloc.dart';
import 'home_screen_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context)
        .add(WeatherFetch(cityName: '', completer: Completer()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          BlocProvider.of<WeatherBloc>(context)
              .add(WeatherFetch(cityName: '', completer: completer));
          completer.future;
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoaded) {
                return SizedBox(
                  width: double.infinity,
                  child: HomeScreenInfo(weatherModel: state.weatherModel),
                );
              }
              if (state is WeatherError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Something went wrong!'),
                      const Text('Please try again later!'),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<WeatherBloc>(context).add(
                                WeatherFetch(
                                    cityName: '', completer: Completer()));
                          },
                          child: const Text('Try again')),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
