import 'package:flutter/material.dart';
import 'package:zlandsfrontend/pages/MappingScreen.dart';
import 'package:zlandsfrontend/pages/SuccessScreen.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

import '../blankscreen.dart';
import '../common_widgets/common_widgets.dart';

class FurtherQuestionsScreen3 extends StatefulWidget {
  const FurtherQuestionsScreen3({super.key});

  @override
  State<FurtherQuestionsScreen3> createState() => _FurtherQuestionsScreen3State();
}

class _FurtherQuestionsScreen3State extends State<FurtherQuestionsScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
       physics: BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "Z-LANDS", FontFamily: 'Jockey One', Fontweight: FontWeight.w400, fontSize: 126),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "  Some Further  ", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 36),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: " Questions ", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 36),
            ],
          ),
          SizedBox(height: 80,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "Has it been recorded?", FontFamily: 'Karla Light', Fontweight: FontWeight.w200, fontSize: 33),
            ],
          ),
        
          SizedBox(
            height: 70,
          ),
            Padding(padding: const EdgeInsets.only(left: 150,right: 150),child: button(Label: "Yes", function: (){
              Navigator.pushReplacement(
                
          context,
          MaterialPageRoute(

            builder: (context) =>SuccessScreen(),));
            }, ZColors: ZColors.buttonColorblue),),
            SizedBox(height: 40,),
            Padding(padding: const EdgeInsets.only(left: 150,right: 150),child: button(Label: "No", function: (){
              Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MappingLand(),));
            }, ZColors: ZColors.buttonColorred),)
            ,SizedBox(height: 30,),
            
          SizedBox(height: 50,)
        ],

      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}