import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String? errorText;
  final void Function(String text) onChanged;
  bool isDirty = false;

  CustomTextFormField({
    required this.labelText,
    required this.onChanged,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget.onChanged(value);

        setState(() {
          widget.isDirty = true;
        });
      },
      decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: widget.isDirty ? widget.errorText : null),
    );
  }
}
