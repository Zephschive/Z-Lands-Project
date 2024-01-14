import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/pages/LoginScreen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 
 
  @override
   void initState() {
    super.initState();
   
    // Simulate a delay for demonstration purposes
    Timer(
      Duration(seconds: 3),
      () {
        // Navigate to the next screen after the delay
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(), // Replace HomeScreen with your main screen
          ),
        );
      },
    );
  }
  Widget build(BuildContext context) 
  {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ZColors.screencolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(
          child: textArea(Label: "Z-LANDS", 
          FontFamily: 'Jockey One', 
          Fontweight: FontWeight.w400, 
          fontSize: 126),
          ),
        
          Container(
            width: media.width * 0.5,
            child: LinearProgressIndicator( 
              color: Colors.blue,

            ),
          )
          
          ],
      ),
    );
  }
}