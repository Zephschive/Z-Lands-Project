import 'package:flutter/material.dart';
import 'package:zlandsfrontend/blankscreen.dart';
import 'package:zlandsfrontend/common_widgets/Landspopup.dart';
import 'package:zlandsfrontend/common_widgets/bottomnavigationbar.dart';
import 'package:zlandsfrontend/pages/ContactUs.dart';
import 'package:zlandsfrontend/pages/MappingScreen.dart';
import 'package:zlandsfrontend/pages/MessageSuccesScreen.dart';
import 'package:zlandsfrontend/pages/MoreInfoScreen.dart';
import 'package:zlandsfrontend/pages/MyProfileScreen.dart';
import 'package:zlandsfrontend/pages/SuccessScreen.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';
import 'package:zlandsfrontend/pages/splashcreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zlands Frontend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashView(),
    );
  }
}


