import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String? errorText;
  final bool obscureText;
  final void Function(String text) onChanged;

  const CustomTextFormField({
    required this.labelText,
    required this.onChanged,
    this.obscureText = false,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isDirty = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      onChanged: (value) {
        widget.onChanged(value);

        setState(() {
          isDirty = true;
          log(isDirty.toString());
        });
      },
      decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: isDirty ? widget.errorText : null),
    );
  }
}
