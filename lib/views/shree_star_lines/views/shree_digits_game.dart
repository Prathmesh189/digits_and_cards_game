import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/views/shree_star_lines/controller/shree_digits_play_controller.dart';
import 'package:get/get.dart';
import '../../../common_widgets/common_title_text_widgets.dart';
import '../../../common_widgets/custom_dashboard_textfield.dart';
import '../../../common_widgets/custom_game_added_list.dart';
import '../../../common_widgets/custom_icon_title.dart';
import '../../../common_widgets/custom_login_button.dart';
import '../../../common_widgets/custom_submit_button.dart';
import '../../../utlis/utils.dart';
import '../../GamePlayScreens/digits/models/toShowUserModel.dart';
import '../../home/controllers/home_controllers.dart';
import '../model/shreeline_add_bid_model.dart';

class ShreeDigitsGame extends StatelessWidget {
  int lineId;
  final String gameName;

  ShreeDigitsGame({required this.lineId, required this.gameName});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ShreeDigitsPlayController controller =
      Get.put(ShreeDigitsPlayController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final List<String> singleDigits = controller.getsingleDigit();
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
        actions: [
          Obx(
            () => Row(
              children: [
                Text(homeController.walletBalance.value.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.050,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 4,
                ),
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
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomIconTitle(Icons.date_range, "Date"),
                                    Text(Utills().updateCurrentDate(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomIconTitle(Icons.numbers, "Digit"),
                                    SizedBox(
                                      width: width * 0.45,
                                      child: DropDownSearchField(
                                        textFieldConfiguration:
                                            TextFieldConfiguration(
                                          controller:
                                              controller.singleDigitsController,
                                          autofocus: false,
                                          style: DefaultTextStyle.of(context)
                                              .style
                                              .copyWith(
                                                fontSize: 20,
                                              ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.red, width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            ),
                                          ),
                                        ),
                                        suggestionsCallback: (pattern) async {
                                          return singleDigits.where((digit) {
                                            return digit.contains(pattern);
                                          }).toList();
                                        },
                                        itemBuilder: (context, suggestion) {
                                          return ListTile(
                                            title: Text(
                                              suggestion,
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          );
                                        },
                                        onSuggestionSelected: (suggestion) {
                                          controller.singleDigitsController.text =
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomIconTitle(
                                        Icons.currency_rupee, "Points"),
                                    CustomDashBoardTextController(
                                      width,
                                      controller.pointsController,
                                      (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter points';
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
                                    if (homeController.walletBalance.value
                                            .toInt() <=
                                        9) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              'Insufficient Balance! Please Add Points ',
                                              selectionColor: Colors.green,
                                            )),
                                      );
                                    } else {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        if (gameName == "jodi") {
                                          if (controller.singleDigitsController
                                                  .text.length ==
                                              2) {
                                            controller.listToSendDB.add(ShreelineAddBidModel(







                                                userId: int.parse(controller.userId.value).toInt(),
                                                game: gameName,
                                                shreeStarLineId: lineId,
                                                bidPoint: int.parse(controller.pointsController.text).toInt(),
                                                value: controller.singleDigitsController.text,








                                            ));
                                            controller.list.add(Toshowusermodel(
                                              controller.sessionStatus.value,
                                              controller.pointsController.text,
                                              controller
                                                  .singleDigitsController.text,
                                            ));
                                            controller.singleDigitsController
                                                .clear();
                                            controller.pointsController.clear();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  backgroundColor: Colors.black,
                                                  content: Text(
                                                    'Invalid digits! Please enter valid Digits',
                                                    selectionColor: Colors.green,
                                                  )),
                                            );
                                          }
                                        } else if (gameName == "Single Digit") {
                                          if (controller.singleDigitsController.text.length == 1) {
                                            controller.listToSendDB.add(ShreelineAddBidModel(
                                                userId: int.parse(controller.userId.value).toInt(),
                                                game: gameName,
                                                shreeStarLineId: lineId,
                                                bidPoint: int.parse(controller.pointsController.text).toInt(),
                                                value: controller.singleDigitsController.text,
                                               ));



                                            controller.list.add(Toshowusermodel(
                                              controller.sessionStatus.value,
                                              controller.pointsController.text,
                                              controller.singleDigitsController.text,
                                            ));

                                            controller.clearTextControllers();

                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  backgroundColor: Colors.black,
                                                  content: Text(
                                                    'Invalid digits! Please enter between 0 and 9',
                                                    selectionColor: Colors.green,
                                                  )),
                                            );
                                          }
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              backgroundColor: Colors.black,
                                              content: Text(
                                                'Invalid digits! Please enter valid Digits',
                                                selectionColor: Colors.green,
                                              )),
                                        );
                                      }
                                    }
                                  },
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(2)),
                            height: height * 0.06,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: width * 0.12,
                                ),
                                CustomDashboardHeadingText(
                                    width, height, "Game-type"),
                                const Spacer(),
                                CustomDashboardHeadingText(
                                    width, height, "Points"),
                                const Spacer(),
                                CustomDashboardHeadingText(
                                    width, height, "Digits"),
                                const Spacer(),
                              ],
                            ),
                          ),
                          Obx(() {
                            return SizedBox(
                              width: width,
                              height: height * 0.4,
                              child: Scrollbar(
                                  child: ListView.builder(
                                itemCount: controller.list.length,
                                itemBuilder: (context, index) {
                                  var a = controller.list[index];
                                  return Container(
                                    color: Colors.grey.shade100,
                                    width: width,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: width - 50,
                                              height: 1,
                                              color: Colors.blueGrey
                                                  .withOpacity(0.5),
                                            ),
                                            Center(
                                              child: CustomGameAdded(
                                                  "Single Digits",
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
                ],
              ),
            ),


            Positioned(
                bottom: 10,
                right: 0,
                child: SizedBox(
                  width: width,
                  child: Center(
                    child: CustomSubmitButton(
                      buttonTitle: 'Submit',
                      onpressed: () {
                        if (controller.listToSendDB.length >= 1) {
                          print(controller.listToSendDB.length);
                          controller.submitBid(controller.listToSendDB, context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
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
          ],
        ),
      ),
    );
  }
}
