import 'package:flutter/material.dart';
import 'package:zlandsfrontend/blankscreen.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/pages/FurtherQuestionsScreen2.dart';

import '../common_widgets/MyInputTextfield.dart';

class FurtherQuestions1Screen extends StatefulWidget {
  const FurtherQuestions1Screen({super.key});

  @override
  State<FurtherQuestions1Screen> createState() => _FurtherQuestions1ScreenState();
}

class _FurtherQuestions1ScreenState extends State<FurtherQuestions1Screen> {
  TextEditingController PhoneNumberController = TextEditingController();
  
  TextEditingController IDNumberController = TextEditingController();
  
  TextEditingController PostalAddressSignupController = TextEditingController();
  
  TextEditingController RegionController = TextEditingController();
  
  TextEditingController AreaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
              textArea(Label: "  Some Further  ", FontFamily: 'Karla Light', Fontweight: FontWeight.w400, fontSize: 36),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: " Questions ", FontFamily: 'Karla Light', Fontweight: FontWeight.w400, fontSize: 36),
            ],
          ),
          SizedBox(height: 20,),
          
       

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputTextArea(height: 450, 
              children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 25,right: 20),
                        child: Column(
                          children: [
                            MyInputTextField(Label: "Mobile Phone Number", Text: PhoneNumberController),
                            SizedBox(height: 20,),
                            MyInputTextField(Label: "ID NUMBER", Text: IDNumberController),
                           SizedBox(height: 20,),
                            MyInputTextField(Label: "Postal Address", Text: PostalAddressSignupController),
                            SizedBox(height: 20,),
                            MyInputTextField(Label: "Region", Text: RegionController),
                            SizedBox(height: 20,),
                             MyInputTextField(Label: "Area", Text: AreaController),
                            SizedBox(height: 20,),
                            
                          ],
                        ),
                      ),
                    ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
            Padding(padding: const EdgeInsets.only(left: 150,right: 150),child: button(Label: "Continue", function: (){
              Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FurtherQuestionsScreen2(),));
            }, ZColors: ZColors.buttonColorblue),)
            ,SizedBox(height: 30,),
            
          SizedBox(height: 30,)
        ],

      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}