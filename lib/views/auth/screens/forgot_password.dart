
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_satka_matka/views/auth/screens/registration_screen.dart';

import '../../../common_widgets/custom_login_button.dart';
import '../../../common_widgets/custom_login_textfield.dart';
import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../controller/login_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {

   ForgotPasswordScreen({super.key});

  final AuthController loginController = Get.put(AuthController());

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: CircleAvatar(
                radius: width * 0.28,
                foregroundImage: const AssetImage(Assets.imagesLogo),
                backgroundColor: Colors.transparent,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width * 0.38,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textfieldColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.iconsWhatsapp,
                        scale: 2.2,
                      ),
                      Text(
                        loginController.agentWhatsAppNo.value.toString(),
                        style: TextStyle(
                          fontSize: width * 0.039,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.38,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textfieldColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone_android),
                      Text(
                        loginController.agentMobNo.value.toString(),
                        style: TextStyle(
                          fontSize: width * 0.039,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomLoginTexField(
              hintText: "Enter your Mobile Number",
              keyboardtype: TextInputType.phone,
              textController: numberController,
            ),
            const SizedBox(height: 20),


            CustomLoginButton(
              buttonTitle: "Get Password",
              onpressed: () {
                loginController.loginUser(
                    context,
                    numberController.text,
                    passwordController.text
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.blue.shade800, fontSize: 20),
                  children: [
                    const TextSpan(
                      text: 'Not Registered?  ',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextSpan(
                      text: 'Sign Up ',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => RegistrationScreen(), transition: Transition.rightToLeft);
                        },
                    ),
                    TextSpan(
                      text: 'Now!',
                      style: TextStyle(color: Colors.blue.shade800, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}