import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/views/GamePlayScreens/cards/controller/cards_play_controller.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/common_title_text_widgets.dart';
import '../../../../common_widgets/custom_dashboard_textfield.dart';
import '../../../../common_widgets/custom_game_added_list.dart';
import '../../../../common_widgets/custom_icon_title.dart';
import '../../../../common_widgets/custom_login_button.dart';
import '../../../../common_widgets/custom_submit_button.dart';
import '../../../../dialog_indicators/invalid_digitssnackbar_.dart';
import '../../../../utlis/utils.dart';
import '../../GamePlayScreens/digits/models/toShowUserModel.dart';
import '../../home/controllers/home_controllers.dart';
import '../controller/shree_card_controller.dart';
import '../model/shreeline_add_bid_model.dart';

class ShreeCardsPlayScreen extends StatelessWidget {
  final int lineId;
  final String gameName;
  final bool toShowSession;

  ShreeCardsPlayScreen(
      {super.key,
      required this.gameName,
      required this.toShowSession,
      required this.lineId});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ShreeCardsPlayController controller = Get.put(ShreeCardsPlayController());

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final List<String> getDoublePatti = controller.getDoublePatti();
    final List<String> getSinglePatti = controller.getSinglePatti();
    final List<String> getTriplePatti = controller.getTriplePatti();

    final HomeController honecontroller = Get.put(HomeController());

    return WillPopScope(
      onWillPop: () async {
        controller.list.clear();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(gameName),
          actions: [
            Obx(
              () => Row(
                children: [
                  Text(honecontroller.walletBalance.value.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.050,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.wallet,
                    size: 38,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconTitle(Icons.date_range, "Date"),
                              Text(Utills().updateCurrentDate(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconTitle(Icons.numbers, "Patti"),
                              SizedBox(
                                width: width * 0.45,
                                child: DropDownSearchField(
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                    controller: controller.pattiController,
                                    autofocus: false,
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                  ),
                                  suggestionsCallback: (pattern) async {
                                    switch (gameName) {
                                      case "Single Patti":
                                        return getSinglePatti
                                            .where((digit) =>
                                                digit.contains(pattern))
                                            .toList();
                                      case "Double Patti":
                                        return getDoublePatti
                                            .where((digit) =>
                                                digit.contains(pattern))
                                            .toList();
                                      case "Triple Patti":
                                        return getTriplePatti
                                            .where((digit) =>
                                                digit.contains(pattern))
                                            .toList();
                                      default:
                                        return [];
                                    }
                                  },
                                  itemBuilder: (context, suggestion) {
                                    return ListTile(
                                      title: Text(
                                        suggestion,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    );
                                  },
                                  onSuggestionSelected: (suggestion) {
                                    print(suggestion);
                                    controller.pattiController.text =
                                        suggestion;
                                  },
                                  displayAllSuggestionWhenTap: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 9),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconTitle(Icons.currency_rupee, "Points"),
                              CustomDashBoardTextController(
                                width,
                                controller.pointsController,
                                (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a points';
                                  }

                                  final number = num.tryParse(value);
                                  if (number == null) {
                                    return 'Please enter a valid number';
                                  }

                                  if (number < 10) {
                                    return 'Minimum value is 10';
                                  }

                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          CustomLoginButton(
                            buttonTitle: "Add",
                            onpressed: () {
                              if (honecontroller.walletBalance.value.toInt() <=
                                  9) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Insuffiecent Balance! Please Add Points ',
                                        selectionColor: Colors.green,
                                      )),
                                );
                              } else {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  if (gameName == "Single Patti") {
                                    if (getSinglePatti.contains(
                                        controller.pattiController.text)) {
                                      print("object");

                                      controller.listToSendDB.add(
                                          ShreelineAddBidModel(
                                            userId: int.parse(controller.userId.value).toInt(),
                                            game: gameName,
                                            shreeStarLineId : lineId,
                                            bidPoint: int.parse(controller.pointsController.text).toInt(),
                                            value: controller.singleDigitsController.text,
                                          )




                                      );
                                      print(controller.pattiController.text);
                                      controller.list.add(Toshowusermodel(
                                        controller.sessionStatus.value,
                                        controller.pointsController.text,
                                        controller.pattiController.text,
                                      ));
                                      controller.clearTextControllers();
                                      showinvalidDigitsSnackbar(
                                          context,
                                          "Your bid has been added to list successfully",
                                          false);
                                    } else {
                                      print("noo");
                                      showinvalidDigitsSnackbar(
                                          context,
                                          "Please select or enter the patti numbers to add bid",
                                          true);
                                      print(controller.pattiController.text);
                                    }
                                  } else if (gameName == "Double Patti") {
                                    if (getDoublePatti.contains(
                                        controller.pattiController.text)) {
                                      print("object");
                                      print(controller.pattiController.text);
                                      controller.list.add(Toshowusermodel(
                                        controller.sessionStatus.value,
                                        controller.pointsController.text,
                                        controller.pattiController.text,
                                      ));
                                      controller.listToSendDB.add(
                                          ShreelineAddBidModel(
                                              userId: int.parse(controller.userId.value).toInt(),
                                              game: gameName,
                                             shreeStarLineId : lineId,
                                              bidPoint: int.parse(controller.pointsController.text).toInt(),
                                              value: controller.singleDigitsController.text,
                                            ));
                                      controller.clearTextControllers();
                                      showinvalidDigitsSnackbar(
                                          context,
                                          "Your bid has been added to list successfully",
                                          false);
                                    } else {
                                      print("noo");
                                      showinvalidDigitsSnackbar(
                                          context,
                                          "You have selected invalid patti Number",
                                          true);
                                      print(controller.pattiController.text);
                                    }
                                  } else if (gameName == "Triple Patti") {
                                    if (getTriplePatti.contains(
                                        controller.pattiController.text)) {
                                      print("object");
                                      print(controller.pattiController.text);
                                      controller.list.add(Toshowusermodel(
                                        controller.sessionStatus.value,
                                        controller.pointsController.text,
                                        controller.pattiController.text,
                                      ));
                                      controller.listToSendDB.add(
                                          ShreelineAddBidModel(
                                              userId: int.parse(controller.userId.value).toInt(),
                                              game: gameName,
                                              shreeStarLineId: lineId,
                                              bidPoint: int.parse(controller.pointsController.text).toInt(),
                                              value: controller.singleDigitsController.text,
                                             ));
                                      controller.clearTextControllers();
                                      showinvalidDigitsSnackbar(
                                          context,
                                          "Your bid has been added to list successfully",
                                          false);
                                    } else {
                                      print("noo");
                                      showinvalidDigitsSnackbar(
                                          context,
                                          "You have selected invalid patti Number",
                                          true);
                                      print(controller.pattiController.text);
                                    }
                                  } else {
                                    Get.snackbar("Something Went Wrong",
                                        "Please Try again later!");
                                  }
                                }
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(2)),
                      height: height * 0.06,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: width * 0.12,
                          ),
                          CustomDashboardHeadingText(
                              width, height, "Game-type"),
                          Spacer(),
                          CustomDashboardHeadingText(width, height, "Points"),
                          Spacer(),
                          CustomDashboardHeadingText(width, height, "Digits"),
                          Spacer(),
                        ],
                      ),
                    ),
                    Obx(() {
                      return SizedBox(
                        width: width,
                        height: height * 0.44,
                        child: Scrollbar(
                            child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.list.length,
                          itemBuilder: (context, index) {
                            var a = controller.list[index];
                            return Container(
                              color: Colors.grey.shade100,
                              width: width,
                              height: 50,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Center(
                                        child: CustomGameAdded(
                                            gameName,
                                            a.point.toString(),
                                            a.digits.toString(),
                                            width,
                                            height),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 6,
              child: Container(
                width: width,
                child: Center(
                  child: CustomSubmitButton(
                    buttonTitle: 'Submit',
                    onpressed: () {
                      if (controller.listToSendDB.length >= 1) {
                        print(controller.listToSendDB.length);
                        controller.submitBid(controller.listToSendDB, context);
                      } else {
                        print(controller.listToSendDB.length);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                'Please Add Your Bid to Submit',
                                selectionColor: Colors.green,
                              )),
                        );
                      }
                    },
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
