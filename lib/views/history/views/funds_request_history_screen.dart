import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_loading.dart';
import '../../../utlis/utils.dart';
import '../controllers/history_controller.dart';

class FundsRequestHistoryScreen extends StatelessWidget {
  FundsRequestHistoryScreen({super.key});

  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.84),
        foregroundColor: Colors.white,
        title: const Text("Funds Request History"),
      ),
      body: Obx(() {
        if (historyController.isLoading.value) {
          return ShimmerLoading(width, height);
        }
        return Container(
          height: height,
          width: width,
          child: ListView.builder(
            itemCount: historyController.fundsHistoryList.length,
            itemBuilder: (context, index) {
              final fundReqModelItem =
                  historyController.fundsHistoryList[index];

              return Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(08),
                    boxShadow: [
                      BoxShadow(offset: Offset(1, 1), color: Colors.red),
                      BoxShadow(offset: Offset(-1, 2), color: Colors.yellow),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID${fundReqModelItem.fundRequestId}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${fundReqModelItem.requestType}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${Utills().parseTimestamp(fundReqModelItem.requestDate.toInt())}',
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "${fundReqModelItem.points}",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
