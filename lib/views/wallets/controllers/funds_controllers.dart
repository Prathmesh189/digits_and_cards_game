import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/constants.dart';
import '../../../dialog_indicators/loading_dialog.dart';
import '../../home/controllers/home_controllers.dart';

class WalletsFundsController extends GetxController {
  var selectedPaymentOption = 'Online Payment'.obs;
  var amountController = TextEditingController();
  var phonenumberController = TextEditingController();
  List<int> walletsPointList = [500, 1000, 2000, 5000, 8000, 10000];
  var isLoading = false.obs;
  final HomeController honecontroller = Get.put(HomeController()  );


  @override
  void onInit() {
    super.onInit();
  }





  void setSelectedPaymentOption(String value) =>
      selectedPaymentOption.value = value;

  Future<void> fundRequest(BuildContext context, String amountValue , String requesFor ,{String takenmobileNumber = "Null" }  ) async {
    isLoading(true);
    loadingDialog(context, "Sending Request");

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      var mobileNumber = prefs.getString('userMobileNumber');





      print("User ID: $userId");

      var requestBody = json.encode({
        "agentId": 1,
        "byWith": "",
        "mobNo": requesFor != "Transfer" ?  mobileNumber : takenmobileNumber ,
        "points": amountValue,
        "requestType": requesFor,
        "reson": " ",
        "status": "Active",
        "userId": userId
      });

      print(requestBody);

      var response = await http.post(
        Uri.parse('${Constants.baseUrl}${Constants.addFundRwquest}'),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      print(response.toString());

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonData = json.decode(response.body);
        print("Response Data: $jsonData");

        Get.back();
        Get.back();

        Get.snackbar("Success", "Funds added successfully!",
            icon: Icon(
              Icons.verified_outlined,
              color: CupertinoColors.white,
              size: 36,
            ),
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else if (response.statusCode == 500) {
        Get.back();
        Get.defaultDialog(
          title: "Error",
          middleText:
              "Something went wrong while processing your request. Please contact support.",
        );
      } else {
        Get.back();
        Get.defaultDialog(
          title: "Error",
          middleText: "An unexpected error occurred. Please try again.",
        );
      }
    } catch (e) {
      print("Error while adding funds: $e");
      Get.defaultDialog(
        title: "Error",
        middleText: "An error occurred: $e",
      );
    } finally {
      honecontroller.getWallet();

      isLoading(false);
    }
  }

}
