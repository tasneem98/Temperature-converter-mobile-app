import 'package:flutter/material.dart';
import 'package:temperature_converter/app/data/temerature_type.dart';
import 'package:temperature_converter/app/widgets/temperature_field.dart';

class TemperatureConverterPage extends StatefulWidget {
  const TemperatureConverterPage({super.key});

  @override
  State<TemperatureConverterPage> createState() =>
      _TemperatureConverterPageState();
}

class _TemperatureConverterPageState extends State<TemperatureConverterPage> {
  final celsius = TextEditingController();
  final kelvin = TextEditingController();
  final fahrenheit = TextEditingController();

  // Convert Celsius-Temp to:
  // => Kelvin  => Fahrenheit
  void celsiusTemperature(value) {
    setState(() {
      //* F = 1.8C + 32
      fahrenheit.text = celsius.text.isEmpty
          ? ''
          : ((1.8 * double.parse(celsius.text)) + 32).toString();

      //* k = C + 273.15
      kelvin.text = celsius.text.isEmpty
          ? ''
          : (double.parse(celsius.text) + 273.15).toString();
    });
  }

  // Convert Kelvin-Temp to:
  // => Celsius  => Fahrenheit
  void kelvinTemperature(value) {
    setState(() {
      //* F = 1.8K - 459.67
      fahrenheit.text = kelvin.text.isEmpty
          ? ''
          : ((1.8 * double.parse(kelvin.text)) - 459.67).toString();

      //* C = K - 273.15
      celsius.text = kelvin.text.isEmpty
          ? ''
          : (double.parse(kelvin.text) - 273.15).toString();
    });
  }

  // Convert Fahrenheit-Temp to:
  // => Celsius  => Kelvin
  void fahrenheitTemperature(value) {
    setState(() {
      //* C = (F - 32) / 1.8
      celsius.text = fahrenheit.text.isEmpty
          ? ''
          : ((double.parse(fahrenheit.text) - 32) / 1.8).toString();

      //* K = ( F + 459.67 )/1.8
      kelvin.text = fahrenheit.text.isEmpty
          ? ''
          : ((double.parse(fahrenheit.text) + 459.67) / 1.8).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(
                top: MediaQuery.paddingOf(context).top,
              ),
            ),

            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Get Started\n',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Temperature Converter with Ease',
                      style: TextTheme.of(context).titleMedium,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Celsius
            TemperatureField(
              title: _temperatureType[0].type,
              symbol: _temperatureType[0].symbol,
              color: _temperatureType[0].color,
              controller: celsius,
              onChanged: celsiusTemperature,
            ),

            // Kelvin
            TemperatureField(
              title: _temperatureType[1].type,
              symbol: _temperatureType[1].symbol,
              color: _temperatureType[1].color,
              controller: kelvin,
              onChanged: kelvinTemperature,
            ),

            // Fahrenheit
            TemperatureField(
              title: _temperatureType[2].type,
              symbol: _temperatureType[2].symbol,
              color: _temperatureType[2].color,
              controller: fahrenheit,
              onChanged: fahrenheitTemperature,
            ),
          ],
        ),
      ),
    );
  }

  final List<TemperatureType> _temperatureType = [
    TemperatureType(color: Colors.green, symbol: '℃', type: 'celsius'),
    TemperatureType(color: Colors.deepPurple, symbol: 'ºK', type: 'kelvin'),
    TemperatureType(color: Colors.deepOrange, symbol: '℉', type: 'fahrenheit'),
  ];
}
