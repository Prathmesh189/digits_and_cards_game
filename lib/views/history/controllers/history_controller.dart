import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_satka_matka/views/history/models/bid_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/constants.dart';
import '../models/funds_request_model.dart';
import '../models/transaction_history_model.dart';
import '../models/winning_model.dart';


class HistoryController extends GetxController{
  var isLoading = false.obs;
  var transactionHistoryList = <TransactionHistoryModel>[].obs;
  var winningHistoryList = <WinningModel>[].obs;
  var bidHistoryList = <BidHistoryModel>[].obs;
  var fundsHistoryList = <FundsRequestModel>[].obs;


  @override
  void onInit()  {
    fetchFundRequestHistory();
    fetchTransactionHistory();
    fetchWinningHistory();
    fetchBidHistory();
    super.onInit();
  }

  void fetchBidHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      print(userId);

      isLoading(true);
      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.BidMasterHistory}/$userId'));

      print(response.statusCode );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        print("Bid history \n ${jsonData}");
        bidHistoryList.value = jsonData.map((transaction) => BidHistoryModel.fromJson(transaction)).toList();
      }else if(response.statusCode == 500){

        Get.defaultDialog(
          title: "Error",
          middleText: "Something went wrong while loading fetchFundRequestHistory history.Please contact Backend  ",
        );

      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Something went wrong while loading transaction history.",
        );
      }
    } catch (e) {
      print("Error while loading Bid history: $e");
    } finally {
      isLoading(false);
    }
  }

  void fetchFundRequestHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      print("${userId }   in fetchFundHistory "    );

      isLoading(true);
      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.FundMasterHistory}/$userId'));

      print(response.statusCode );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        fundsHistoryList.value = jsonData.map((transaction) => FundsRequestModel.fromJson(transaction)).toList();

      }else if(response.statusCode == 500){
        Get.defaultDialog(
          title: "Error",
          middleText: "Something went wrong while loading Bid history.Please contact Backend  ",
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Something went wrong while loading transaction history.",
        );
      }
    } catch (e) {
      print("Error while loading transaction history: $e");
    } finally {
      isLoading(false);
    }
  }

  void fetchTransactionHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      print(" $userId   is   userID");

      isLoading(true);
      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.getTransactionHistoryList}/$userId'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        transactionHistoryList.value = jsonData
            .map((transaction) => TransactionHistoryModel.fromJson(transaction))
            .toList();
      } else {

      }
    } catch (e) {
      print("Error while loading fetchTransactionHistory history: $e");
    } finally {
      isLoading(false);
    }
  }

  void fetchWinningHistory() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userId = prefs.getString('userId');
      
      
      print("${userId }   in winning "    );

      isLoading(true);
      var response = await http.get(Uri.parse('${Constants.baseUrl}${Constants.winMasterHistory}/$userId'));

      print(response.statusCode );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        winningHistoryList.value = jsonData
            .map((transaction) => WinningModel.fromJson(transaction))
            .toList();
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

}