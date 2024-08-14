import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomLoginTexField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final TextInputType keyboardtype;
  final String? Function(String?)? validator;

  const CustomLoginTexField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.keyboardtype,
    this.validator,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: keyboardtype,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        suffixIconColor: Colors.blue,
        labelText: hintText,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none, // Remove default border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.shade800 , width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }
}
