import 'package:flutter/material.dart';
import 'package:zlandsfrontend/pages/FurtherQuestionsScreen3.dart';
import 'package:zlandsfrontend/pages/NoteBeSureScreen.dart';

import '../blankscreen.dart';
import '../common_widgets/common_widgets.dart';

class FurtherQuestionsScreen2 extends StatefulWidget {
  const FurtherQuestionsScreen2({super.key});

  @override
  State<FurtherQuestionsScreen2> createState() => _FurtherQuestionsScreen2State();
}

class _FurtherQuestionsScreen2State extends State<FurtherQuestionsScreen2> {
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
              textArea(Label: "  Some Further  ", FontFamily: 'Karla', Fontweight: FontWeight.w400, fontSize: 36),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: " Questions ", FontFamily: 'Karla', Fontweight: FontWeight.w400, fontSize: 36),
            ],
          ),
          SizedBox(height: 80,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "Do you own a Land", FontFamily: 'Karla Light', Fontweight: FontWeight.w200, fontSize: 33),
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "  Property ?", FontFamily: 'Karla Light', Fontweight: FontWeight.w200, fontSize: 33),
            ],
          ),
          SizedBox(
            height: 70,
          ),
            Padding(padding: const EdgeInsets.only(left: 150,right: 150),child: button(Label: "Yes", function: (){
              Navigator.pushReplacement(

          context,
          MaterialPageRoute(

            builder: (context) => FurtherQuestionsScreen3(),));
            }, ZColors: ZColors.buttonColorblue),),
            SizedBox(height: 40,),
            Padding(padding: const EdgeInsets.only(left: 150,right: 150),child: button(Label: "No", function: (){
              Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NoteBeSureScreen(),));
            }, ZColors: ZColors.buttonColorred),)
            ,SizedBox(height: 30,),
            
          SizedBox(height: 50,)
        ],

      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}