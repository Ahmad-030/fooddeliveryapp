import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/OnBoarding%20Screens/Login.dart';
import 'package:fooddelivery/OnBoarding%20Screens/OnBoarding.dart';
import 'package:fooddelivery/OnBoarding%20Screens/forget.dart';
import 'package:fooddelivery/SettingScreen/profiledrawer.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
        builder: (context) => MyApp())
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Onboarding(),
    );
  }
}
