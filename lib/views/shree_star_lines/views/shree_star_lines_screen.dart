import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/common_widgets/custom_loading.dart';
import 'package:flutter_satka_matka/views/shree_star_lines/views/shree_line_bid_history.dart';
import 'package:flutter_satka_matka/views/shree_star_lines/views/shree_line_dashboard.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';
import '../../../utlis/utils.dart';
import '../../home/controllers/home_controllers.dart';
import '../controller/shree_line_controller.dart';

class ShreeStarLinesScreen extends StatelessWidget {
  ShreeStarLinesScreen({super.key});

  final ShreeLineController controller = Get.put(ShreeLineController()   );
  final HomeController homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shree Star Line"),
        actions: [
          Obx(
                () => Row(
              children: [
                Text(homecontroller.walletBalance.value.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.050,
                        fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                const Icon(
                  Icons.wallet,
                  size: 38,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.history_toggle_off_sharp,
                    color: Colors.red, size: 45),
                title: Text(
                  "Shree Star line Bid History",
                  style: TextStyle(
                      fontSize: width * 0.042, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.add_chart, color: Colors.red, size: 45),
                  title: Text(
                    "Shree line Chart",
                    style: TextStyle(
                        fontSize: width * 0.041, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Get.to(ShreeLineBidHistory());
                },
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Assets.iconsWinningHistory,
                      color: Colors.red,
                      width: width * 0.081,
                    ),
                  ),
                  title: Text(
                    "Shree Star line Winning History",
                    style: TextStyle(
                        fontSize: width * 0.040, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.2),
                        offset: const Offset(3, 3),
                      ),
                      BoxShadow(
                          color: Colors.red.withOpacity(0.2),
                          offset: const Offset(-3, 0)),
                    ],
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 3, color: Colors.red)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text(
                    "Shree Star Line",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const BoxShadow(
                            offset: Offset(-1, -1), color: Colors.orangeAccent)
                      ],
                      fontSize: width * 0.072,
                    ),
                  ),
                ),
              ),
               Divider(

                 thickness: 5,
              ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.activeList.length,
                    itemBuilder: (context, index) {
                      var itemindex = controller.activeList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: Colors.red.shade100,
                          onTap: () {
                            ShreeLineController.checkTimeRange(itemindex.startTime, itemindex.endTime, context, itemindex.shreeStarLineId);
                            },
                          child: Container(
                              padding: const EdgeInsets.only(left: 9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(2, 2),
                                        color: Colors.grey.shade300,
                                        blurRadius: 1,
                                        spreadRadius: 1),
                                    const BoxShadow(
                                        offset: Offset(2, 2),
                                        color: Colors.grey,
                                        blurRadius: 4,
                                        spreadRadius: 4),
                                  ],
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.orangeAccent, width: 1)),
                              width: width * 0.19,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        itemindex.name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: width * 0.05,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                          Colors.red,
                                          BlendMode.srcATop,
                                        ),
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            HomeController().checkActiveStatus(
                                                itemindex.startTime,
                                                itemindex.endTime)
                                                ? Colors.green
                                                : Colors.red,
                                            BlendMode.srcATop,
                                          ),
                                          child: Lottie.asset(
                                              'assets/animations/active_lottie.json',
                                              width: width * 0.14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    HomeController().checkActiveStatus(
                                      itemindex.startTime,
                                      itemindex.endTime,)
                                        ? "Betting has been closed "
                                        : "Betting is Running Currently",
                                    style:
                                    const TextStyle(color: Colors.red, fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${itemindex.openPannaDigit}-${itemindex.jodiDigit == null ? "***" : itemindex.jodiDigit}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 21),
                                  ),
                                  const Divider(
                                    thickness: 3,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time),
                                      Container(
                                        margin: const EdgeInsets.all(5),
                                        child: Text(
                                          "Start Time ${Utills().formatTimestamp(itemindex.startTime).toString()}  "
                                              "End Time ${Utills().formatTimestamp(itemindex.endTime).toString()} ",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  );
                }),
              )
            ],
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: ShimmerLoading(width, 120 ) ,
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}