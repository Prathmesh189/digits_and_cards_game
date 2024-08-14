import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_satka_matka/utlis/utils.dart';
import '../../../common_widgets/custom_loading.dart';
import '../controllers/history_controller.dart';

class TransactionHistoryScreen extends StatelessWidget {
  TransactionHistoryScreen({super.key});

  final HistoryController historyController = Get.put(HistoryController() ,permanent: true);

  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.84),
        foregroundColor: Colors.white,
        title: const Text("Transaction History"),
      ),
      body: Obx(() {
        if (historyController.isLoading.value) {
          return ShimmerLoading(width,height  );



        }


        return ListView.builder(
          itemCount: historyController.transactionHistoryList.length,
          itemBuilder: (context, index) {
            final transaction = historyController.transactionHistoryList[index];
            String sign = transaction.tranStatus == "Debit" ? "-" : "+";
            Color textColor = transaction.tranStatus != "Debit" ?
            Colors.green.shade900 : Colors.red.shade900;

            return Container(
              margin:  EdgeInsets.all(10),
              decoration:  BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 2),
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        " ${transaction.tranType}",
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " Transaction Id -${ transaction.userTransctionId.toString()} ",
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,

                          fontSize: 15,
                        ),
                      ),
                     Text(" ${ Utills().parseTimestamp(transaction.dateTime)}"),

                    ],
                  ),
                  Text(
                    "$sign ${transaction.points}/-  ",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.05,
                    ),
                  ),
              ],
              ),
            );
          },
        );
      }),
    );
  }
}