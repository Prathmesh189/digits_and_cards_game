import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/constants/constants.dart';
import 'package:flutter_satka_matka/utlis/utils.dart';
import 'package:flutter_satka_matka/views/singleViewa/dashboard.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dialog_indicators/time_unmatched.dart';
import '../../singleViewa/models/notifications_model.dart';
import '../model/gamerate_model.dart';
import '../model/image_slider_model.dart';
import '../model/line_master_new_model.dart';

class HomeController extends GetxController {
  var banners = <BannerModel>[].obs;
  var activeList = <LineMasterNewModel>[].obs;
  var notificationList = <NotificationsModel>[].obs;
  var isLoading = true.obs;
  RxString betStatus = "".obs;
  var gamerateList = <GamerateModel>[].obs;
  RxDouble walletBalance =  0.0.obs;
  RxString username = " ".obs;
  RxString phoneNumber = " ".obs;

  @override
  void onInit() {
    getName();
    fetchBanners();
    fetchActiveLineMaster();
    fetchGameRate();
    getWallet();
    fetchNotifications();
    super.onInit();
  }

  void getName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('userName') ?? "New Balaji satta matta";
    phoneNumber.value = prefs.getString('userMobileNumber') ?? "New Balaji satta matta";

    print("Usename is ${prefs.getString('userName')}");
  }





  void fetchNotifications() async {
    try {
      var response = await http
          .get(Uri.parse('${Constants.baseUrl}${Constants.getNotiication}'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        print("Notification List");
        print(jsonData);
        notificationList.value = jsonData
            .map((transaction) => NotificationsModel.fromJson(transaction))
            .toList();
      } else {


      }
    } catch (e) {
      print("Error While fetchNotifications Rate: $e");
    } finally {
      isLoading(false);
    }
  }




  void fetchGameRate() async {
    try {
      var response = await http
          .get(Uri.parse('${Constants.baseUrl}${Constants.gameRateList}'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        print("Game Rate");
        print(jsonData);
        gamerateList.value = jsonData
            .map((transaction) => GamerateModel.fromJson(transaction))
            .toList();
      } else {}
    } catch (e) {
      print("Error While Game Rate: $e");
    } finally {
      isLoading(false);
    }
  }
  Future <double> getWallet() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');

      username.value = prefs.getString('userName')?? " ";

      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.getUSer}/$userId'));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        print(jsonData['walletPoints']);
        walletBalance.value = jsonData['walletPoints'];
        print("wallet balance iss");
        print(jsonData['walletPoints']);
        return jsonData['walletPoints'];
      } else {

        Get.snackbar("Failed to get wallet balance", " Please try again later or restart the app ");

        return 00.00;
      }
    } catch (e) {
      return 00.00;
    } finally {

      isLoading(false);
    }
  }

  void fetchBanners() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('${Constants.baseUrl}${Constants.getBanners}'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        banners.value =
            jsonData.map((banner) => BannerModel.fromJson(banner)).toList();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void fetchActiveLineMaster() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('${Constants.baseUrl}${Constants.getActiveLineList}'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        activeList.value = jsonData
            .map((activeList) => LineMasterNewModel.fromJson(activeList))
            .toList();

        print(jsonData);

        isLoading(false);
      } else {
        Get.defaultDialog(
          title: "Something Went Wrong Help Contact Support while Loading Line",
        );

        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      print("error while Loading Active list:::--------- ${e}   ");
    }
  }

  static void checkTimeRange(int startTime, int endTime, BuildContext context, int id) {
    DateTime now = DateTime.now();
    DateTime start = DateTime.fromMillisecondsSinceEpoch(startTime);
    DateTime end = DateTime.fromMillisecondsSinceEpoch(endTime);
    TimeOfDay nowTime = TimeOfDay(hour: now.hour, minute: now.minute);
    TimeOfDay startTimeOfDay =
        TimeOfDay(hour: start.hour, minute: start.minute);
    TimeOfDay endTimeOfDay = TimeOfDay(hour: end.hour, minute: end.minute);

    if (Utills.isTimeInRange(nowTime, startTimeOfDay, endTimeOfDay)) {
      print('Hello');

      Get.to(() => Dashboard(lineid: id));
    } else {
      showTimeUnmatchedDialog(context);
      print('Current time is not within the range.');
      print('Start Time: ${DateFormat('h:mm a').format(start)}');
      print('End Time: ${DateFormat('h:mm a').format(end)}');
    }
  }

  bool checkActiveStatus(int startTime, int endTime) {
    DateTime now = DateTime.now();
    DateTime start = DateTime.fromMillisecondsSinceEpoch(startTime);
    DateTime end = DateTime.fromMillisecondsSinceEpoch(endTime);
    TimeOfDay nowTime = TimeOfDay(hour: now.hour, minute: now.minute);
    TimeOfDay startTimeOfDay =
        TimeOfDay(hour: start.hour, minute: start.minute);
    TimeOfDay endTimeOfDay = TimeOfDay(hour: end.hour, minute: end.minute);

    if (Utills.isTimeInRange(nowTime, startTimeOfDay, endTimeOfDay)) {
      print('Hello');
      betStatus.value = "Active";
      return true;
    } else {
      betStatus.value = "InActive";
      print(endTime.toString());
      return false;
    }
  }
}
