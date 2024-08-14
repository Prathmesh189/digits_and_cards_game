import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onpressed;

  const CustomSubmitButton({super.key, required this.buttonTitle,     required this.onpressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.brown,
                  blurRadius: 5,
                  offset: Offset(3,5)
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Colors.grey,
                Colors.grey,
                Colors.grey,
                Colors.grey.shade200
              ]
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(buttonTitle,
            style:  TextStyle(
              color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),),
        ),
      ),
    );
  }
}