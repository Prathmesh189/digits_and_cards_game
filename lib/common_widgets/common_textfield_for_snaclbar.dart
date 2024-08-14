
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget common_textfield_for_snaclbar(double width,
   // KeyboardType h,
    String hint,
    String label,
    TextEditingController textController,
    String? Function(String?)? validator) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    width: width * 0.95,
    child: TextFormField(
      controller: textController,
      keyboardType: TextInputType.text,
      enableSuggestions: false,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
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
