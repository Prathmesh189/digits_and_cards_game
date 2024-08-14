import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackBarSaveButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onpressed;



  const CustomSnackBarSaveButton({super.key, required this.buttonTitle,     required this.onpressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.4,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 5,
                  offset: Offset(3,5)
              ),
            ],
            color: Colors.red.shade600,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(buttonTitle,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),),
        ),
      ),
    );
  }
}
