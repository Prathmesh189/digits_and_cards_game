
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../common_widgets/custom_loading.dart';
import '../../../utlis/utils.dart';
import '../controllers/history_controller.dart';

class WinningHistoryScreen extends StatelessWidget {
  WinningHistoryScreen({super.key});

  final HistoryController historyController = Get.put(HistoryController());



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.84),
        foregroundColor: Colors.white,
        title: const Text("Winning History"),
      ),
      body: Obx(() {
        if (historyController.isLoading.value) {
          return ShimmerLoading(width,height  );
        }
        return Container(
          height: height,
          width: width,
          child: ListView.builder(
            itemCount: historyController.winningHistoryList.length,
            itemBuilder: (context, index) {
              final winModelItem = historyController.winningHistoryList[index];

              return Container(
                margin: EdgeInsets.symmetric(vertical: 10 ,horizontal: 3   ),
                padding: EdgeInsets.all( 5),

                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1,1),
                          color: Colors.red


                      ),
                      BoxShadow(
                          offset: Offset(-1,1),
                          color: Colors.red
                      ),
                    ]
                ),


                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(" ID  ${winModelItem.winingId.toString()}",style: const TextStyle(
                          fontSize: 21,
                        ),   ),


                        Padding(
                          padding: const EdgeInsets.only(  right:  8),
                          child: Text( Utills().parseTimestamp(winModelItem.winDate)  ,
                            style: const TextStyle(
                              fontSize: 14,
                            ),   ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(winModelItem.winStatus  ,
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(  " RS ${winModelItem.winPoints.toStringAsFixed(1) }/-  " ,
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    ),

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
