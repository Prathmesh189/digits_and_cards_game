import 'package:flutter/material.dart';
import 'package:flutter_satka_matka/views/auth/screens/loginPage.dart';
import 'package:flutter_satka_matka/views/landing_Page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId');

  runApp(
      MyApp(isLoggedIn: userId != null)
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Satta Matka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.84),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24
            )
        ),
        useMaterial3: true,
      ),
      home: isLoggedIn ? LandingPage() : LoginScreen(),
      // home: isLoggedIn ? DigitsPlayScreen(id: 1, gameId: 1,) : LoginScreen(),
    );
  }
}