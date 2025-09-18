import 'package:flutter/material.dart';
import 'package:temperature_converter/app_theme.dart';
import 'package:temperature_converter/temperature_converter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature converter mobile app',
      theme: AppTheme.themeData(context),
      home: const TemperatureConverterApp(),
    );
  }
}
