
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../common_widgets/custom_loading.dart';
import '../../../utlis/utils.dart';
import '../controllers/history_controller.dart';

class   bidHistoryScreen   extends StatelessWidget {
bidHistoryScreen  ({super.key});

   final HistoryController historyController = Get.put(HistoryController());



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.84),
        foregroundColor: Colors.white,
        title: const Text("Bids History"),
      ),
      body: Obx(() {
        if (historyController.isLoading.value) {
          return  ShimmerLoading(width,height  );
        }
        return Container(
          height: height,
          width: width,
          child: ListView.builder(
            itemCount: historyController.bidHistoryList.length,
            itemBuilder: (context, index) {
              final bidModelItem = historyController.bidHistoryList[index];

              return Container(
                margin: EdgeInsets.symmetric(vertical: 10 ,horizontal: 8   ),
                padding: EdgeInsets.all(5),

                decoration: BoxDecoration(
                  color: Colors.white,
                  
                  borderRadius: BorderRadius.circular(08),
                  
                  
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1,-1),
                      color: Colors.grey



                    ),
                    BoxShadow(
                      offset: Offset(-1,1),
                      color: Colors.red.shade100,
                      spreadRadius: 1,
                      blurRadius: 4
                    ),
                  ]
                ),


                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("#BID${bidModelItem.bidId.toString()}",style: const TextStyle(
                        fontSize: 14,
                      ),   ),
                    ),


                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Date: ',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                          TextSpan(
                            text: '${  Utills().parseTimestamp(   bidModelItem.bidDate.toInt() )   }',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Point: ',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                          TextSpan(
                            text: '${bidModelItem.bidPoint  }',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                        ],
                      ),
                    ),



                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Value: ',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                          TextSpan(
                            text: '${bidModelItem.value  }',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Session: ',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                          TextSpan(
                            text: '${bidModelItem.session}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Add appropriate color
                            ),
                          ),
                        ],
                      ),
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
