import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../constants/constants.dart';
import '../../../dialog_indicators/time_unmatched.dart';
import '../../../utlis/utils.dart';
import '../../history/models/winning_model.dart';
import '../../home/model/line_master_new_model.dart';
import '../../singleViewa/dashboard.dart';
import '../model/shreestarline_model.dart';
import '../views/shree_line_dashboard.dart';

class ShreeLineController extends GetxController{

  var winningHistoryList = <WinningModel>[].obs;
  var activeList = <ShreestarlineModel>[].obs;
  RxString betStatus = "".obs;
  var isLoading = false.obs;


  @override
  void onInit() {
    fetchActiveLineMaster();
    fetchShreeWinningHistory();

    super.onInit();
  }

  void fetchShreeWinningHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');


      print("${userId }  in USER ID " );

      isLoading(true);
      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.ShreeBidWinningHistory}/$userId'));

      print(response.statusCode );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;

        print(jsonData);
        winningHistoryList.value = jsonData.map((transaction) => WinningModel.fromJson(transaction)).toList();
      }
      else if(response.statusCode == 500){
        Get.defaultDialog(
          title: "Error",
          middleText: "Something went wrong while loading Win history.Please contact Backend  ",
        );
      }
      else {
        Get.defaultDialog(
          title: "t",
          middleText: "Something went wrong while loading History history.",
        );
      }
    } catch (e) {
      print("Error while loading fetchWinningHistory : $e");
    } finally {
      isLoading(false);
    }
  }


  void fetchActiveLineMaster() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.ShreeLineGames}'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        activeList.value = jsonData.map((activeList) => ShreestarlineModel.fromJson(activeList)).toList();
        print("Shree line star");
        print(jsonData);

        isLoading(false);
      }else{
        Get.defaultDialog(
          title: "Something Went Wrong Help Contact Support while Shree Loading Line",
        );

        isLoading(false);

      }

    } catch (e) {
      isLoading(false);
      print("error while Loading Active list:::--------- ${e}   ");
    }
  }

  static void checkTimeRange(int startTime, int endTime,BuildContext context , int id) {
    DateTime now = DateTime.now();
    DateTime start = DateTime.fromMillisecondsSinceEpoch(startTime);
    DateTime end = DateTime.fromMillisecondsSinceEpoch(endTime);
    TimeOfDay nowTime = TimeOfDay(hour: now.hour, minute: now.minute);
    TimeOfDay startTimeOfDay = TimeOfDay(hour: start.hour, minute: start.minute);
    TimeOfDay endTimeOfDay = TimeOfDay(hour: end.hour, minute: end.minute);

    print('Start Time: ${DateFormat('h:mm a').format(start)}');
    print('End Time: ${DateFormat('h:mm a').format(end)}');

    if ( Utills.isTimeInRange(nowTime, startTimeOfDay, endTimeOfDay)) {
      Get.to(  ()=>   ShreeLineDashboard(  lineID: id,    )   );
      print("Print the id $id");
    } else {
      showTimeUnmatchedDialog(context);

    }
  }


  bool checkActiveStatus(int startTime, int endTime ) {
    DateTime now = DateTime.now();
    DateTime start = DateTime.fromMillisecondsSinceEpoch(startTime);
    DateTime end = DateTime.fromMillisecondsSinceEpoch(endTime);
    TimeOfDay nowTime = TimeOfDay(hour: now.hour, minute: now.minute);
    TimeOfDay startTimeOfDay = TimeOfDay(hour: start.hour, minute: start.minute);
    TimeOfDay endTimeOfDay = TimeOfDay(hour: end.hour, minute: end.minute);

    if ( Utills.isTimeInRange(nowTime, startTimeOfDay, endTimeOfDay)) {
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