import 'package:flutter/material.dart';
import 'package:temperature_converter/app_theme.dart';
import 'package:temperature_converter/result_field.dart';

class TemperatureConverterApp extends StatefulWidget {
  const TemperatureConverterApp({super.key});

  @override
  State<TemperatureConverterApp> createState() =>
      _TemperatureConverterAppState();
}

class _TemperatureConverterAppState extends State<TemperatureConverterApp> {
  final degrees = TextEditingController();
  final celsius = TextEditingController();
  final kelvin = TextEditingController();
  final fahrenheit = TextEditingController();

  String selectedTemperature = 'Celsius';

  bool resultVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              children: [
                Flexible(
                  child: TextFormField(
                    style: AppTheme.kTextStyle,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus!.unfocus(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Degrees',
                      labelStyle: AppTheme.kLabelStyle(context),
                    ),
                    onChanged: (_) => setState(() => resultVisibility = false),
                    controller: degrees,
                  ),
                ),
                Flexible(
                  child: DropdownButtonFormField(
                    initialValue: selectedTemperature,
                    decoration: InputDecoration(
                      labelText: 'Type',
                      labelStyle: AppTheme.kLabelStyle(context),
                    ),
                    items: ['Celsius', 'Fahrenheit', 'Kelvin']
                        .map(
                          (temperature) => DropdownMenuItem(
                            value: temperature,
                            child: Text(temperature),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        resultVisibility = false;
                        selectedTemperature = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (degrees.text.isNotEmpty) {
                  setState(() {
                    resultVisibility = true;

                    if (selectedTemperature == 'Fahrenheit') {
                      /*
                  | To convert Fahrenheit to Celsius, we use the formula **C = (F - 32) / 1.8**.
                  | To convert Fahrenheit to Kelvin, we use the formula **K = ( F + 459.67 )/1.8**.
                  */
                      celsius.text = ((double.parse(degrees.text) - 32) / 1.8)
                          .toString();
                      kelvin.text =
                          ((double.parse(degrees.text) + 459.67) / 1.8)
                              .toString();
                    }

                    if (selectedTemperature == 'Kelvin') {
                      /*
                  | To convert Kelvin to Celsius, we use the formula **C = K - 273.15**.
                  | To convert Kelvin to Fahrenheit, we use the formula **F = 1.8K - 459.67**.
                  */
                      celsius.text = (double.parse(degrees.text) - 273.15)
                          .toString();
                      fahrenheit.text =
                          ((1.8 * double.parse(degrees.text)) - 459.67)
                              .toString();
                    }

                    if (selectedTemperature == 'Celsius') {
                      /*
                  | To convert Celsius to Fahrenheit, we use the formula **F = 1.8C + 32**.
                  | To convert Celsius to Kelvin, we use the formula **k = C + 273.15**.
                  */
                      fahrenheit.text =
                          ((1.8 * double.parse(degrees.text)) + 32).toString();
                      kelvin.text = (double.parse(degrees.text) + 273.15)
                          .toString();
                    }
                  });
                }
              },
              child: const Text('Convert'),
            ),
            Visibility(
              visible: resultVisibility,
              child: Text(
                'Results',
                style: AppTheme.kTitleLarge(context).copyWith(
                  color: AppTheme.kTertiary(context),
                ),
              ),
            ),

            Visibility(
              visible: resultVisibility,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  if (selectedTemperature != 'Fahrenheit')
                    ResultField(
                      labelText: 'Fahrenheit',
                      controller: fahrenheit,
                    ),
                  if (selectedTemperature != 'Kelvin')
                    ResultField(
                      labelText: 'Kelvin',
                      controller: kelvin,
                    ),
                  if (selectedTemperature != 'Celsius')
                    ResultField(
                      labelText: 'Celsius',
                      controller: celsius,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
