import 'package:flutter/material.dart';
import 'package:medoloc/aut_screen/getstart.dart';
import 'package:medoloc/screens/bot_nav/navigation_bar.dart';
import 'package:medoloc/screens/hospital_details_screen/hospital_detail_screen.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/sub_screens/all_appointments_detail_screen.dart';
import 'package:medoloc/sub_screens/contact_screen.dart';
import 'package:medoloc/sub_screens/sos_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
                fontFamily: "Poppins",
                colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
                useMaterial3: true,
              ),
      home: 
      // GetStartedScreen(),
       BottomNavBarExample(),
      // HospitalDetailsScreen(), 
    );
  }
}