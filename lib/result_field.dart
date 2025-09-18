import 'package:flutter/material.dart';
import 'package:temperature_converter/app_theme.dart';

class ResultField extends StatelessWidget {
  const ResultField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTheme.kTextStyle,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTheme.kLabelStyle(context),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.kTertiary(context)),
        ),
      ),
      onChanged: null,
      enabled: false,
      controller: controller,
    );
  }
}
