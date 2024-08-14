import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/views/shree_star_lines/views/shree_digits_game.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_satka_matka/constants/constants.dart';
import '../../GamePlayScreens/cards/views/cards_play_screen.dart';

class ShreeLineDashboard extends StatelessWidget {
  final int lineID;

  const ShreeLineDashboard({super.key, required this.lineID});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shree Star Line Dashboard"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: height * 0.27,
              mainAxisSpacing: 6),
          itemCount: Constants().ShreedashboardModellist.length,
          itemBuilder: (context, index) {
            var item = Constants().ShreedashboardModellist[index];
            return InkWell(
              onTap: (){
                if( index == 0   ){
                  Get.to(() => ShreeDigitsGame(lineId: lineID ,gameName :"Single Digit"  ));
                }else if(  index == 1  || index == 2 || index ==  3){
                  String gameName;
                  switch (index) {
                    case 1:
                      gameName = "Single Patti";
                      break;
                    case 2:
                      gameName = "Double Patti";
                      break;
                    case 3:
                      gameName = "Triple Patti";
                      break;
                    default:
                      gameName = "";
                  }
                  Get.to(() => CardsPlayScreen(id: index +1, gameId: lineID, gameName: gameName, toShowSession: false  ));
                }else if (index == 5  || index ==6   ){
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
                          Colors.red.withOpacity(0.99),
                          Colors.red.withOpacity(0.93),
                          Colors.red.withOpacity(0.73),
                          Colors.blueGrey.withOpacity(0.93),
                          Colors.grey.withOpacity(0.93)
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
                          fontSize: 19,
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