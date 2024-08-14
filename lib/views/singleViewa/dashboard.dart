import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constants/constants.dart';
import '../GamePlayScreens/Sangam/views/sangam_play_screen.dart';
import '../GamePlayScreens/cards/views/cards_play_screen.dart';
import '../GamePlayScreens/digits/views/digits_play_Screen.dart';

class Dashboard extends StatelessWidget {
  final int lineid;

  const Dashboard({super.key, required this.lineid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: height * 0.27, mainAxisSpacing: 6),
          itemCount: Constants().dashboardModellist.length,
          itemBuilder: (context, index) {
            var item = Constants().dashboardModellist[index];
            return InkWell(
              onTap: (){

                if( index == 0  || index ==1 ){
                  String gameName;
                  switch (index) {
                    case 0:
                      gameName = "Single Digit";
                      break;
                    case 1:
                      gameName = "jodi";
                      break;
                    default:
                      gameName = "error";
                  }
                  Get.to(() => DigitsPlayScreen(id: lineid, gameId: index,  gameName: gameName,  toShowSession: index != 1? true : false     ));


                }else if(  index == 2  || index ==3 || index ==4      ){
                  String gameName;
                  switch (index) {
                    case 2:
                      gameName = "Single Patti";
                      break;
                    case 3:
                      gameName = "Double Patti";
                      break;
                    case 4:
                      gameName = "Triple Patti";
                      break;
                    default:
                      gameName = "";
                  }
                  Get.to(() => CardsPlayScreen(id: lineid, gameId: 1, gameName: gameName, toShowSession: true,  ));
                }else if (index == 5  || index ==6   ){
                  String gameName;

                  switch (index) {
                    case 5:
                      gameName = "Half Sangam";
                      break;
                    case 6:
                      gameName = "Full Sangam";
                      break;
                    default:
                      gameName = "";
                  }

                  Get.to(() => SangamPlayScreen(id: lineid, gameId: index,  gameName: gameName,  toShowSession: index != 6? true : false     ));



                }





              },
              child: Container(
                margin: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(7, 8),
                          color: Colors.brown,
                          spreadRadius: 2,
                          blurRadius: 5),
                      BoxShadow(
                          offset: Offset(-1, -2),
                          color: Colors.white,
                          blurRadius: 5)
                    ],
                    gradient: LinearGradient(
                        end: Alignment.topLeft,
                        begin: Alignment.bottomRight,
                        colors: [

                          Colors.red.withOpacity(0.83),
                          Colors.red.withOpacity(0.73),
                          Colors.red.withOpacity(0.73),
                          Colors.blueGrey.withOpacity(0.93),
                          Colors.grey.withOpacity(0.99),
                          Colors.transparent,
                        ]),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      item.image,
                      scale: MediaQuery.of(context).size.width / 90,
                    ),
                    Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 21,
                          letterSpacing: 1,
                          shadows: [
                            BoxShadow(offset: Offset(5, 5), color: Colors.black45),],
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}