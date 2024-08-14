import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../history/views/funds_request_history_screen.dart';
import '../../history/views/winnings_history_Screen.dart';
import '../../home/controllers/home_controllers.dart';
import '../controllers/funds_controllers.dart';
import 'add_funds.dart';

class WalletsPage extends StatelessWidget {
  WalletsPage({super.key});

  WalletsFundsController controller = WalletsFundsController();
  final HomeController honecontroller = Get.put(HomeController());
  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Wallet ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red.shade800,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(74)),
              color: Colors.red.shade800,
            ),
            width: width,
            height: height * 0.21,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 025,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                        size: width * 0.08,
                      ),
                      Obx( ()=> Text(honecontroller.walletBalance.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.095,
                          fontWeight: FontWeight.bold),  ),)
                      
                      
                      

                    ],
                  ),
                  const Text(
                    " Wallet Balance",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.black38)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => AddFundsScreen(isAddFund: true));
                  },
                  title: Text("Add Funds",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.057,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.black38)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => AddFundsScreen(iswithdrawFund: true));
                  },
                  title: Text("Withdraw Funds",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.057,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.black38)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => AddFundsScreen(isWalletTranser: true));
                  },
                  title: Text("Wallet Transfer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.057,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.black38)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => FundsRequestHistoryScreen());
                  },
                  title: Text("Fund Request History",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.057,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(width: 2, color: Colors.black38)),
                child: ListTile(
                  onTap: () {
                    Get.to(WinningHistoryScreen());
                  },
                  title: Text("Winning History",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.057,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}