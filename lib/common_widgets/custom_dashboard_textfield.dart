import 'package:flutter/material.dart';

Widget CustomDashBoardTextController(double width, TextEditingController textController, String? Function(String?)? validator) {
  return SizedBox(
    width: width * 0.45,
    child: TextFormField(
      controller: textController,
      keyboardType: TextInputType.number,
      enableSuggestions: true,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      validator: validator,
    ),
  );
}


