import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.obscureText = false,
    this.onChaged,
    required this.hintText,
    this.inputType,
  });
  final String hintText;
  Function(String)? onChaged;
  bool obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field required';
        }
        return null;
      },
      onChanged: onChaged,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xff6D2932),
          ),
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
