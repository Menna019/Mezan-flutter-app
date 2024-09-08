import 'package:flutter/material.dart';
import 'package:mizan_app/CacheHelper.dart';
import 'package:mizan_app/homescreen.dart';
import 'package:mizan_app/login.dart';
//import 'package:your_app/home.dart'; // تأكد من استيراد الصفحة الرئيسية
//import 'package:your_app/cache_helper.dart'; // تأكد من استيراد CacheHelper

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.initial();

  bool isLoggedIn = await CacheHelper.containKey(key: 'isLoggedIn');
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLoggedIn ? '/homePage' : '/loginPage',
      routes: {
        '/loginPage': (context) => Home2(),
        '/homePage': (context) => Home(),
      },
    );
  }
}