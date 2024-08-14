import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_satka_matka/generated/assets.dart';
import 'package:flutter_satka_matka/views/history/views/funds_request_history_screen.dart';
import 'package:flutter_satka_matka/views/history/views/transaction_history.dart';
import 'package:flutter_satka_matka/views/history/views/bids_history_screen.dart';
import '../../../common_widgets/custom_history_button.dart';
import '../controllers/history_controller.dart';
import 'winnings_history_Screen.dart';

class HistoryScreen extends StatelessWidget {
   HistoryScreen({super.key});

   final HistoryController historyController = Get.put(HistoryController() ,permanent: true);


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          HistoryButton(
              width,
              height,
              Icon(Icons.history, size: width * 0.091, color: Colors.white),
              "Transaction History", () {
                Get.to(() =>  TransactionHistoryScreen()  );
          }),
          HistoryButton(
              width,
              height,
              Icon(Icons.monetization_on_outlined,
                  size: width * 0.091, color: Colors.white),
              "Bid History", () {
            Get.to(() =>  bidHistoryScreen()  );



            print("hello");
          }),
          HistoryButton(
              width,
              height,
              Icon(Icons.request_quote,
                  size: width * 0.091, color: Colors.white),
              "Fund Request History", () {
            print("hello");


            Get.to(() =>  FundsRequestHistoryScreen()  );
          }),
          HistoryButton(
              width,
              height,
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(
                  Assets.iconsWinningHistory,
                  height: width * 0.81,
                  width: width * 0.081,
                ),
              ),
              "Winning History", () {
            Get.to(() =>  WinningHistoryScreen()  );

            print("hello");
          }),
        ],
      ),
    ));
  }
}