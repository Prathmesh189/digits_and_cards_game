import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onpressed;



  const CustomLoginButton({super.key, required this.buttonTitle,     required this.onpressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 47,
        decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.brown,
              blurRadius: 5,
              offset: Offset(3,5)
            ),
          ],
            color: CupertinoColors.black,
            borderRadius: BorderRadius.circular(35)),
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
