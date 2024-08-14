 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../views/auth/controller/login_controller.dart';

class CustomPasswordLoginTexField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool isConfirmPassword;

  CustomPasswordLoginTexField({
    Key? key,
    required this.textController,
    required this.hintText,
    this.isConfirmPassword = false,
  }) : super(key: key);

  final AuthController loginController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool obsecure = isConfirmPassword
          ? loginController.passwordconfimshow.value
          : loginController.passwordshow.value;

      return TextField(
        controller: textController,
        keyboardType: TextInputType.text,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.redAccent),
          filled: true,
          suffix: InkWell(
            onTap: () {
              if (isConfirmPassword) {
                loginController.toggleConfirmPasswordVisibility();
              } else {
                loginController.togglePasswordVisibility();
              }
            },
            child: Icon(
              !obsecure ? Icons.visibility_off : Icons.remove_red_eye_outlined,
            ),
          ),
          suffixIconColor: Colors.grey,
          labelText: hintText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textfieldColor, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      );
    });
  }
}