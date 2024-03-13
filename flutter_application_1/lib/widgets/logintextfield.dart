// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/textfieldstyles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasObscurity;

  const LoginTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.hasObscurity = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasObscurity,
      controller: controller,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
      },
      decoration: InputDecoration(
          hintText: "Add your username",
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
          border: OutlineInputBorder()),
    );
  }
}
