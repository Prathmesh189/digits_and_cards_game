import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/common_widgets/custom_loading.dart';
import 'package:flutter_satka_matka/dialog_indicators/bank_details_bottom.dart';
import 'package:flutter_satka_matka/generated/assets.dart';
import 'package:get/get.dart';

import '../../dialog_indicators/address_deatils_bottom.dart';
import '../../dialog_indicators/phonepe_bottom.dart';
import '../home/controllers/home_controllers.dart';
import 'controller/profilePageController.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  final profileScreenController = Get.put(ProfileScreenController());
  final HomeController honecontroller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Colors.red,
      body: Obx(() {

        return Column(
          children: [
            Container(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.04),
                  Stack(
                    children: [
                      ClipOval(
                          child: Image.asset(
                        Assets.imagesDedaultProfileImage,
                        width: height * 0.128,
                      )),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${honecontroller.username}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: width * 0.05,
                    ),
                  ),
                  Text(
                    "${honecontroller.phoneNumber}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                height: height * 0.58,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, -1),
                        color: Colors.grey,
                        blurRadius: 30,
                        spreadRadius: 1),
                  ],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Profile Details",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.07),
                    ),
                    Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    ListTile(
                      splashColor: Colors.red,
                      onTap: () {
                        AddressBottomSheet.show(
                            context,
                            profileScreenController.addressTextController,
                            profileScreenController.cityTextController,
                            profileScreenController.pinTextController);
                      },
                      tileColor: Colors.red,
                      leading: Image.asset(
                        Assets.iconsAddress,
                        height: width * 0.087,
                        width: width * 0.11,
                      ),
                      title: Text("Address ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                    ListTile(
                      splashColor: Colors.red,
                      onTap: () {
                        BankDetailsBottom.show(
                            context,
                            profileScreenController.accountNumberController,
                            profileScreenController.accountHolderNameController,
                            profileScreenController.bankNameController,
                            profileScreenController.ifscCodeController);
                        print("object");
                      },
                      tileColor: Colors.red,
                      leading: Image.asset(
                        Assets.iconsBank,
                        height: width * 0.087,
                        width: width * 0.11,
                      ),
                      title: Text("Bank Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                    ListTile(
                      splashColor: Colors.red,
                      onTap: () {

                        phonePeControllerSheet.show(context, profileScreenController.addressTextController);


                      },
                      tileColor: Colors.red,
                      leading: Image.asset(
                        Assets.iconsPhonepe,
                        height: width * 0.087,
                        width: width * 0.11,
                      ),
                      title: Text("PhonePe",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                    ListTile(
                      splashColor: Colors.red,
                      onTap: () {

                        phonePeControllerSheet.show(context, profileScreenController.addressTextController);

                      },
                      tileColor: Colors.red,
                      leading: Image.asset(
                        Assets.iconsPaytm,
                        height: width * 0.1,
                        width: width * 0.11,
                      ),
                      title: Text("Paytm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                    ListTile(
                      splashColor: Colors.red,
                      onTap: () {
                        phonePeControllerSheet.show(context, profileScreenController.addressTextController);
                        },
                      tileColor: Colors.red,
                      leading: Image.asset(Assets.iconsGooglePay,
                          height: width * 0.11, width: width * 0.11),
                      title: Text("Googel Pay",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
