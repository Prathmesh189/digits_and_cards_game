import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_satka_matka/constants/constants.dart';
import 'package:flutter_satka_matka/utlis/utils.dart';
import 'package:flutter_satka_matka/views/home/model/gamerate_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../landing_Page.dart';

class AuthController extends GetxController {
  RxBool passwordshow = true.obs;
  RxBool passwordconfimshow = true.obs;
  RxString agentID = "".obs;
  RxString agentWhatsAppNo = "".obs;
  RxString userName = "".obs;
  RxString agentMobNo = "".obs;


  @override
  void onInit() {
    GetNumbers();

    super.onInit();
  }









  void togglePasswordVisibility() {
    passwordshow.value = !passwordshow.value;
  }

  void toggleConfirmPasswordVisibility() {
    passwordconfimshow.value = !passwordconfimshow.value;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }


  Future<void> loginUser(BuildContext context, String phonenumber, String password) async {
    final url = '${Constants.baseUrl}${Constants.userLogin}';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'userMob': phonenumber,
      "password": password,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['message'] == "Password is Invalid.") {
          Utills().snackBar(context, true, "Password is Invalid.");
        } else if (responseBody['message'] == "Mobile No is not found") {
          Utills().snackBar(context, true, "Mobile number not found you need to Register with ${phonenumber}  ");
        } else if (responseBody['message'] == "Login Success") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String agentId = responseBody['agentId']?.toString() ?? "1";
          String userFullName = responseBody['fullName']?.toString() ?? "1";
          String userId = responseBody['userId']?.toString() ?? "1";

          String usermobileNumber = responseBody['mobNo']?.toString() ?? "777";

          prefs.setString('userName', userFullName);
          prefs.setString('agentId', agentId);
          prefs.setString('userId', userId);
          prefs.setString('userMobileNumber', usermobileNumber);


          userName.value = userFullName ;


          Get.to(() => LandingPage(), transition: Transition.leftToRightWithFade);
          Utills().snackBar(context, false, "Welcome! ${responseBody['fullName']},""Login has been done Successfull ");
        }

        print('User data saved to SharedPreferences');
      } else {

        Utills().snackBar(context, true, "Something went wrong Please Try again Later");
        print('Failed to register user: ${response.statusCode}');
      }
    } catch (e) {
      print('Error registering user: $e');
    } finally {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? agentId = prefs.getString('agentId');

      print(agentId);
      print(agentId);
    }
  }



  Future<void> GetNumbers() async {
    final url = '${Constants.baseUrl}${Constants.adminDetails}/1';
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String savedAgentId = responseBody['agentId']?.toString() ?? "1";
        agentID.value = savedAgentId ;
        prefs.setString('agentId', savedAgentId);
        print(" Agent Id i Got  ${savedAgentId}");

        agentWhatsAppNo.value = responseBody['whatsAppNo']?.toString() ?? "1";
        agentMobNo.value = responseBody['agentMobNo']?.toString() ?? "1";

        print( agentMobNo.value);





      }else{
        print("responseBody");

      }


    } catch (e) {
      print('Error registering user: $e');
    } finally {

    }
  }


  Future<void> registerUser(String username, String phonenumber, String password) async {

    final url = '${Constants.baseUrl}${Constants.registerUser}';
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'fullName': username,
      'mobNo': phonenumber,
      'password': password,
      "agentId": 1
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);

        print('User has done registered successfully ');
      } else {
        print('Failed to register user: ${response.statusCode}');
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }





}
