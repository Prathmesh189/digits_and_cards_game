import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/utlis/utils.dart';
import 'package:get/get.dart';
import 'package:flutter_satka_matka/views/singleViewa/rate_master.dart';

import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../auth/controller/login_controller.dart';
import '../../shree_star_lines/views/shree_star_lines_screen.dart';
import 'components/CauroselWidgets.dart';
import 'components/listviewbuilder.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AuthController loginController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ImageSlider(),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: width * 0.42,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.textfieldColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: (){
                            print( loginController.agentWhatsAppNo.value.toString());

                            Utills().openWhatsApp(  loginController.agentWhatsAppNo.value.toString());


                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.iconsWhatsapp,
                                scale: 2.2,
                              ),
                              Obx(() {
                                return Text(
                                  loginController.agentWhatsAppNo.value.toString(),
                                  style: TextStyle(
                                    fontSize: width * 0.039,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to( ()=> RateMasterScreen() ,transition:Transition.zoom  );
                        },
                        child: Container(
                          width: width * 0.42,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.textfieldColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.price_change_outlined),
                              Text(
                                "Rate Master",
                                style: TextStyle(
                                  fontSize: width * 0.042,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(

                    onTap: (){


                      Get.to(() =>
                          ShreeStarLinesScreen());

                      print("object");



                    },

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: width,
                        height: height * 0.06,
                        decoration: BoxDecoration(

                          color:  Colors.black,

                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: height * 0.04),
                            Text(
                              "Shree Star Line",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.star, color: Colors.white, size: height * 0.04),
                            SizedBox(width: width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(Assets.iconsPlayButton, scale: height / 800),
                                Text(
                                  "Play Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.01,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: HomePageListBuilder(), // Assuming ListViewBuilder is a widget that returns a ListView
      ),
    );
  }
}
