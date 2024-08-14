import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_satka_matka/generated/assets.dart';

import '../../../../common_widgets/custom_loading.dart';
import '../../../../utlis/utils.dart';
import '../../controllers/home_controllers.dart';

class HomePageListBuilder extends StatelessWidget {
  HomePageListBuilder({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(
            child: ShimmerLoading(width,height  ),
          );
        }

        if (homeController.activeList.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        return Container(
          child: ListView.builder(
            itemCount: homeController.activeList.length,
            itemBuilder: (context, index) {
              final item = homeController.activeList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    HomeController.checkTimeRange(item.lineStartTime, item.lineEndTime, context ,item.lineId );
                  },
                  child: Container(
                    width: width - 20,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(5, 9),
                          color: Colors.grey,
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          offset: Offset(-1, -1),
                          color: Colors.grey,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: height * 0.015),
                              padding: EdgeInsets.symmetric(vertical: height * 0.003),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.red,
                                  Colors.red,
                                  Colors.black87,
                                ]),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(44)),),
                              child: Text(
                                '  ${item.lineName}  ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.045,
                                    letterSpacing: 1),
                              ),
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return Text(HomeController().betStatus.value);
                                }),
                                ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    HomeController().checkActiveStatus(
                                      item.lineStartTime, item.lineEndTime,)
                                        ? Colors.green
                                        : Colors.red,
                                    BlendMode.srcATop,
                                  ),
                                  child: Lottie.asset(
                                      'assets/animations/active_lottie.json',
                                      width: width * 0.14
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height * 0.02),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: width * 0.058, color: Colors.red),
                                  children: [
                                    TextSpan(
                                      text: "${item.lineOpenNo}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),),
                                    TextSpan(
                                      text: "-${item.lineMidNo}-",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),),
                                    TextSpan(
                                      text: "${item.lineCloseNo}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),),
                                  ]),
                            ),
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: Container(
                            width: width - 50,
                            height: height * 0.03,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10))),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(fontSize: width * 0.038,
                                        color: Colors.white),
                                    children: [
                                      const TextSpan(text: 'Bid Opens At ',),
                                      TextSpan(
                                        text: ' ${Utills().formatTimestamp(
                                            item.lineStartTime).toString()} ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),),
                                      const TextSpan(text: 'and Closes At ',),
                                      TextSpan(
                                        text: ' ${Utills().formatTimestamp(
                                            item.lineEndTime).toString()} ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}