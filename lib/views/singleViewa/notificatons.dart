import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/utlis/utils.dart';
import 'package:get/get.dart'; // Ensure GetX package is imported
import '../home/controllers/home_controllers.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController()); // Initialize HomeController

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Obx(() {
        if (homeController.notificationList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: homeController.notificationList.length,
            itemBuilder: (context, index) {
              var notification = homeController.notificationList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.red.shade100 ,width: 1  )
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  tileColor: Colors.grey[50],
                  title: Text(notification.notificationMasterTitle,style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.notificationMasterDesc),
                      Align(
                        alignment: Alignment.bottomRight,
                          child: Text( Utills().parseTimestamp( notification.notificationMasterDate ,onlyTime: 2) ,style: TextStyle(
                            fontStyle: FontStyle.italic
                          ),  )   ),
                    ],
                  ),
                  // Customize based on your NotificationsModel fields
                ),
              );
            },
          );
        }
      }),
    );
  }
}
