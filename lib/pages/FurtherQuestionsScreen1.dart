import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/FurtherQuestionsScreen2.dart';
import '../common_widgets/MyInputTextfield.dart';

class FurtherQuestions1Screen extends StatefulWidget {
  const FurtherQuestions1Screen({Key? key}) : super(key: key);

  @override
  State<FurtherQuestions1Screen> createState() => _FurtherQuestions1ScreenState();
}

class _FurtherQuestions1ScreenState extends State<FurtherQuestions1Screen> {
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController IDNumberController = TextEditingController();
  TextEditingController PostalAddressSignupController = TextEditingController();
  TextEditingController RegionController = TextEditingController();
  TextEditingController AreaController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  DB_help DB = DB_help();
    bool na = true;

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
          Form(
            key: formkey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputTextArea(
                  height: 450,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25, right: 20),
                      child: Column(
                        children: [
                          MyInputTextField(
                            Label: "Mobile Phone Number",
                            Text: PhoneNumberController,
                            valid: (value) {
                              if (value!.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                return "Invalid phone number";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          MyInputTextField(
                            Label: "ID NUMBER",
                            Text: IDNumberController,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "Please enter ID number";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          MyInputTextField(
                            Label: "Postal Address",
                            Text: PostalAddressSignupController,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "Please enter postal address";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          MyInputTextField(
                            Label: "Region",
                            Text: RegionController,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "Please enter region";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          MyInputTextField(
                            Label: "Area",
                            Text: AreaController,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "Please enter area";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150),
            child: na?button(
              Label: "Continue",
              function: () {
                setState(() {
                  na= false;
                  
                  
                });
                if (formkey.currentState!.validate()) {
                  DB.AddFurtherDetails(PhoneNumberController.text, IDNumberController.text, 
                  PostalAddressSignupController.text, RegionController.text,AreaController.text, context, FurtherQuestionsScreen2());
                 
                 
                  Timer(Duration(seconds: 15), () { 
                    setState(() {
                  na= true;
                  
                });
                  });
                }else{
                showDialog(
    context: context,
    builder: (context) => WarningDialog(DialogQuestion: "An Error Has Occured While Signing in")
  ); setState(() {
                  na= true;
                });
              }
              },
              ZColors: ZColors.buttonColorblue,
            ):SizedBox(height: 120,width: 120, child: CircularProgressIndicator( color: Colors.white,)),
          ),
          SizedBox(height: 30,),
          SizedBox(height: 30,)
        ],
      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}
