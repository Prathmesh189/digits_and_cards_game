import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/constants.dart';
import '../models/user_model.dart';

class ProfileScreenController extends GetxController {
  var userModelList = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  TextEditingController addressTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController pinTextController = TextEditingController();

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();



  @override
  void onInit() {
    // fetchUserData();
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

        addressTextController.text =   userModelList[0].address;
        cityTextController.text =   userModelList[0].city;
        pinTextController.text =   userModelList[0].pincode.toString();


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
}