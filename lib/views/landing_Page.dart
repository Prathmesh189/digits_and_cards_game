import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/generated/assets.dart';
import 'package:flutter_satka_matka/views/singleViewa/notificatons.dart';
import 'package:flutter_satka_matka/views/singleViewa/profile_page.dart';
import 'package:flutter_satka_matka/views/singleViewa/webView.dart';
import 'package:flutter_satka_matka/views/wallets/views/Wallets_page.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'auth/controller/login_controller.dart';
import 'history/views/history.dart';
import 'home/controllers/home_controllers.dart';
import 'home/views/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final AuthController loginController = Get.put(AuthController());
  final HomeController homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      HistoryScreen(),
      // ShimmerLoading(width, height),
      ProfilePageScreen(),
      WebviewScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.84),
        leadingWidth: width * 0.4,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Image.asset(Assets.imagesLogo)  ,
            ),
            Obx(() {
              return SizedBox(
                child: Text(
                  homecontroller.username.value.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04),
                ),
              );
            })
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => WalletsPage());
            },
            child:        Obx(() => Row(
              children: [
                Text( homecontroller.walletBalance.value.toString() ,
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
          ),
          GestureDetector(
            onTap: (){
              Get.to(() => NotificationScreen());
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 17.0, right: 12),
              child: Icon(
                Icons.notifications,
                size: 38,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.red.withOpacity(0.85),
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.history),
            title: Text("History"),
            selectedColor: Colors.white,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("My Profile"),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.assignment_turned_in),
            title: Text("Result"),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}