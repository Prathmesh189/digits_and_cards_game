import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/constants.dart';
import '../../../../dialog_indicators/loading_dialog.dart';
import '../../GamePlayScreens/digits/models/toShowUserModel.dart';
import '../../home/controllers/home_controllers.dart';
import '../model/shreeline_add_bid_model.dart';

class ShreeDigitsPlayController extends GetxController {
  var walletBalance = 0.obs;
  var currentDate = ''.obs;
  var sessionStatus = 'Open'.obs;

  var sessionStatusList = <String>[].obs;
  TextEditingController singleDigitsController = TextEditingController();
  TextEditingController pointsController = TextEditingController();
  RxList<Toshowusermodel> list = <Toshowusermodel>[].obs;
  RxList<ShreelineAddBidModel> listToSendDB = <ShreelineAddBidModel>[].obs;
  RxBool isLoading = false.obs;
  final HomeController honecontroller = Get.put(HomeController()  , permanent: true );




  var agentID = ''.obs;
  var userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    honecontroller.walletBalance();
    updateCurrentDate();
    fetchSessionStatuses();
    getUserAndAdminId();
    fetchWalletBalance();
  }


  void fetchWalletBalance () async {
    print("fetchWalletBalance");
    double newBalance = await honecontroller.getWallet();
    walletBalance.value = newBalance.toInt();
    print(" g");
  }

  void getUserAndAdminId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    agentID.value = prefs.getString('agentId') ?? '';
    userId.value = prefs.getString('userId') ?? '';
  }

  void clearTextControllers() {
    pointsController.clear();
    singleDigitsController.clear();
  }


  Future<void> submitBid(List listToSendDB, BuildContext context   ) async {

    final url = Uri.parse('${Constants.baseUrl}${Constants.ShreeSendBid}');
    try {
      isLoading(true);
      loadingDialog(context  ,  "Making Transactions");
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json',},
          body: jsonEncode(listToSendDB));

      print(jsonEncode(listToSendDB));

      if (response.statusCode == 200) {
        isLoading(false);
        print('Bid submit successfully');
        Get.back();
        Get.back();
        honecontroller.getWallet();

        Get.snackbar(" Successful", "Your Bid Has Been successfully Got Placed " , backgroundColor: Colors.green.shade100.withOpacity(0.6) );


      } else {
        isLoading(false);
        print('Failed to submit Shree line bid: ${response.body}');
        Get.snackbar("Something went wrong!", "Please Try again later!");
      }
    } catch (e) {
      isLoading(false);
      print('Error occurred while submit bid: $e');
    }finally{

    }

  }


  List<String> getJodiDigit() {
    List<String> jodiDigit = [
      "00",
      "01",
      "02",
      "03",
      "04",
      "05",
      "06",
      "07",
      "08",
      "09",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      "30",
      "31",
      "32",
      "33",
      "34",
      "35",
      "36",
      "37",
      "38",
      "39",
      "40",
      "41",
      "42",
      "43",
      "44",
      "45",
      "46",
      "47",
      "48",
      "49",
      "50",
      "51",
      "52",
      "53",
      "54",
      "55",
      "56",
      "57",
      "58",
      "59",
      "60",
      "61",
      "62",
      "63",
      "64",
      "65",
      "66",
      "67",
      "68",
      "69",
      "70",
      "71",
      "72",
      "73",
      "74",
      "75",
      "76",
      "77",
      "78",
      "79",
      "80",
      "81",
      "82",
      "83",
      "84",
      "85",
      "86",
      "87",
      "88",
      "89",
      "90",
      "91",
      "92",
      "93",
      "94",
      "95",
      "96",
      "97",
      "98",
      "99"
    ];
    return jodiDigit;
  }

  List<String> getsingleDigit() {
    List<String> singleDigit = [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
    ];
    return singleDigit;
  }



  void updateWalletBalance(int newBalance) {
    walletBalance.value = newBalance;
  }


  void updateCurrentDate() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('dd MMM yyyy');
    currentDate.value = formatter.format(now);
  }

  void updateSessionStatus(String status) {
    sessionStatus.value = status;
  }

  void fetchSessionStatuses() {
    sessionStatusList.assignAll(['Open', 'Close']);
    sessionStatus.value = sessionStatusList.first; // Set the initial value
  }
}
