import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/weather_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final client = initApiClient();
  initializeDateFormatting('ru_RU', null).then(
    (_) {
      runApp(const MyApp());
    },
  );
}
