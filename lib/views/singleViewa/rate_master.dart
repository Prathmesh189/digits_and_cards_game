import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../home/controllers/home_controllers.dart';

class RateMasterScreen extends StatelessWidget {
  RateMasterScreen({Key? key}) : super(key: key);

  final HomeController gameRateController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.84),
        foregroundColor: Colors.white,
        title: const Text("Game Rates"),
      ),
      body: Obx(() {
        if (gameRateController.isLoading.value) {
          return Center(child: Lottie.asset(Assets.animationsLoader ,height: height,
            fit: BoxFit.cover


          ));
        }

        if (gameRateController.gamerateList.isEmpty) {
          return const Center(child: Text("No game rates available"));
        }

        return ListView.builder(
          itemCount: gameRateController.gamerateList.length,
          itemBuilder: (context, index) {
            final gameRate = gameRateController.gamerateList[index];

            print( gameRateController.gamerateList.length);

            return Container(
              margin: const EdgeInsets.all(4),
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),

                boxShadow: [
                  const BoxShadow(
                    offset: Offset(1,4),
                    color: Colors.black
                  )
                ]
              ),

              child: ListTile(
                title : Text( "RS ${gameRate.gameRate.toInt().toString()}" ,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17)
                ),
                trailing: Text(gameRate.gameName  ,
                style: const TextStyle(
                 fontWeight: FontWeight.bold,
                    color: Colors.black,
                  fontSize: 18),


                ),


              ),
            );
          },
        );
      }),
    );
  }
}

