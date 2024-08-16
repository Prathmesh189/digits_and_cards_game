import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/constants.dart';
import '../../home/controllers/home_controllers.dart';
import '../models/user_model.dart';

class ProfileScreenController extends GetxController {

  final HomeController homecontroller = Get.put(HomeController());


  var userModelList = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  TextEditingController addressTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController pinTextController = TextEditingController();

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();

  TextEditingController paytmNumberController = TextEditingController();

  TextEditingController gpayNumberController = TextEditingController();

  TextEditingController phonepeNumberController = TextEditingController();


  String? fullName  ;
  String? mobileNumber  ;
  String? email  ;
  String? password  ;
  int? walletPoints  ;



  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  void fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    print("UserId: $userId");
    print("Fetching User Data...");

    try {
      isLoading(true);
      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.getUSer}/$userId'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        userModelList.value = [UserModel.fromJson(jsonData)];

        fullName = userModelList[0].fullName;
        mobileNumber = userModelList[0].mobNo;
        email = userModelList[0].email;
        password = userModelList[0].password;
        walletPoints =  int.parse(userModelList[0].walletPoints.toString());


        addressTextController.text =   userModelList[0].address;
        cityTextController.text =   userModelList[0].city;
        pinTextController.text =   userModelList[0].pincode.toString();

        accountNumberController.text = userModelList[0].accountNo.toString();
        bankNameController.text = userModelList[0].bankName.toString();;
        ifscCodeController.text = userModelList[0].ifscCode.toString();
        accountHolderNameController.text = userModelList[0].accountHolderName.toString();

        paytmNumberController.text = userModelList[0].paytmNumber.toString();

        phonepeNumberController.text = userModelList[0].phonepeNumber.toString();

        gpayNumberController.text = userModelList[0].gpayNumber.toString();




        print("User Data: $jsonData");
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Something went wrong. Please contact support.",
        );
      }
    } catch (e) {
      print("Error loading user data: $e");
    } finally {
      isLoading(false);
    }
  }



  Future<void> updateUser() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('userId');
    var agentId = prefs.getString('agentId');




    final url = Uri.parse('${Constants.baseUrl}${Constants.editUser}');
    final Map<String, dynamic> requestBody = {
      "userId": userId,
      "fullName": fullName,
      "mobNo": mobileNumber,
      "email": email,
      "password": password,
      "walletPoints": homecontroller.walletBalance.toInt(),
      "token": "someTokenString",
      "address": addressTextController.text,
      "city": cityTextController.text,
      "pincode": pinTextController.text,
      "accountNo": accountNumberController.text,
      "bankName": bankNameController.text,
      "ifscCode": ifscCodeController.text,
      "accountHolderName": accountHolderNameController.text,
      "paytmNumber": paytmNumberController.text,
      "gpayNumber": gpayNumberController.text,
      "phonepeNumber": phonepeNumberController.text,
      "status": "active",
      "agentId": agentId.toString()
    };

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      print('statusCode to update user: ${response.statusCode}');
      if (response.statusCode == 200) {

        print('User updated successfully');
      } else {
        // Error occurred
        print('Failed to update user: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }






}