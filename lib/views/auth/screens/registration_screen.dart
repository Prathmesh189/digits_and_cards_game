import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_satka_matka/views/auth/screens/loginPage.dart';
import '../../../common_widgets/custom_login_button.dart';
import '../../../common_widgets/custom_login_textfield.dart';
import '../../../common_widgets/custom_password_field.dart';
import '../../../generated/assets.dart';
import '../controller/login_controller.dart';


class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final AuthController loginController = Get.put(AuthController());

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: CircleAvatar(
                  radius: width * 0.28,
                  foregroundImage: AssetImage(Assets.imagesLogo),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 20),
              CustomLoginTexField(
                hintText: "Enter your Name",
                keyboardtype: TextInputType.name,
                textController: nameController,
              ),
              SizedBox(height: 20),
              CustomLoginTexField(
                keyboardtype: TextInputType.phone,
                hintText: "Enter your Mobile Number",
                textController: numberController,
              ),
              SizedBox(height: 20),
              CustomPasswordLoginTexField(
                hintText: "Enter your Password",
                textController: passwordController,
                isConfirmPassword: false,
              ),
              SizedBox(height: 20),
              CustomPasswordLoginTexField(
                hintText: "Confirm your Password",
                textController: confirmPasswordController,
                isConfirmPassword: true,
              ),
              SizedBox(height: 20),
              CustomLoginButton(
                buttonTitle: "Register",
                onpressed: () {
                  loginController.registerUser(
                    nameController.text,
                      numberController.text ,
                      passwordController.text ,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.blue.shade800, fontSize: 20),
                    children: [
                      TextSpan(
                        text: 'Already have an account?  ',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextSpan(
                        text: 'Login ',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => LoginScreen(), transition: Transition.zoom);
                          },
                      ),
                      TextSpan(
                        text: 'here',
                        style: TextStyle(color: Colors.blue.shade800, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}