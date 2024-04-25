import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/weather_app.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then(
    (_) {
      runApp(const MyApp());
    },
  );
}
