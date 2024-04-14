import 'package:flutter/material.dart';
import 'package:weather_app/ui/theme/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkTheme = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: themeData.textTheme.displayMedium,
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Темная тема'),
            value: _darkTheme,
            onChanged: (bool value) {
              setState(() {
                _darkTheme = value;
                // TODO: Добавьте код для переключения темы
              });
            },
          ),
          SwitchListTile(
            title: const Text('Уведомления'),
            value: _notifications,
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
                // TODO: Добавьте код для включения/отключения уведомлений
              });
            },
          ),
        ],
      ),
    );
  }
}
