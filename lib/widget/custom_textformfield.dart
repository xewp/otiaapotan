import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final int fontSize;
  final EdgeInsets contentPadding;
  final TextAlign textAlign;
  final TextInputType keyboardType; // Add keyboardType parameter

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    required this.fontSize,
    required this.contentPadding,
    required this.textAlign,
    this.keyboardType = TextInputType.text, // Default to text input type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize.toDouble(), // Apply font size
      ),
      textAlign: textAlign, // Apply text alignment
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: fontSize.toDouble(), // Apply font size to hint text
        ),
        filled: false,
        border: UnderlineInputBorder( // Thin underline
          borderSide: BorderSide(color: Colors.white, width: 1), // Thin white underline
        ),
        enabledBorder: UnderlineInputBorder( // Thin underline when not focused
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: UnderlineInputBorder( // Thin underline when focused
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        contentPadding: contentPadding, // Apply custom padding
      ),
      keyboardType: keyboardType, // Use the provided keyboard type
    );
  }
}