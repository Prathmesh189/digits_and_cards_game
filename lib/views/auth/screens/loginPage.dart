import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_satka_matka/constants/app_colors.dart';
import 'package:flutter_satka_matka/views/auth/screens/registration_screen.dart';
import '../../../common_widgets/custom_login_button.dart';
import '../../../common_widgets/custom_login_textfield.dart';
import '../../../common_widgets/custom_password_field.dart';
import '../../../generated/assets.dart';
import '../controller/login_controller.dart';
import 'forgot_password.dart';

class LoginScreen extends StatelessWidget {
  final AuthController loginController = Get.put(AuthController());

  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // WhatsApp number container
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
                          Obx(() {
                            return Text(
                              loginController.agentWhatsAppNo.value.toString(),
                              style: TextStyle(
                                fontSize: width * 0.039,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    // Phone number container
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
                          Icon(Icons.phone_android),
                          Obx(() {
                            return Text(
                              loginController.agentMobNo.value.toString(),
                              style: TextStyle(
                                fontSize: width * 0.039,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomLoginTexField(
                  hintText: "Enter your Mobile Number",
                  keyboardtype: TextInputType.phone,
                  textController: numberController,
                  validator: validateMobileNumber,
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    CustomPasswordLoginTexField(
                      hintText: "Enter your Password",
                      isConfirmPassword: true,
                      textController: passwordController,
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ForgotPasswordScreen());
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.0381,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                CustomLoginButton(
                  buttonTitle: "Login",
                  onpressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginController.loginUser(
                        context,
                        numberController.text,
                        passwordController.text,
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.blue.shade800, fontSize: 20),
                      children: [
                        TextSpan(
                          text: 'Not Registered?  ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        TextSpan(
                          text: 'Sign Up ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(
                                    () => RegistrationScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                        ),
                        TextSpan(
                          text: 'Now!',
                          style: TextStyle(
                              color: Colors.blue.shade800, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
