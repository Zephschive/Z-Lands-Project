import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/MyInputTextfield.dart';

import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/FurtherQuestionsScreen1.dart';
import 'package:zlandsfrontend/pages/LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController FullNameController = TextEditingController();
  TextEditingController EmailSignUpController = TextEditingController();
  TextEditingController PasswordSignupController = TextEditingController();
  TextEditingController ReEnterPasswordController = TextEditingController();
  final signupformkey = GlobalKey<FormState>();
  DB_help db =DB_help();

  bool na = true;



  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    
    print(media.height * 0.52);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(
                  Label: "Z-LANDS",
                  FontFamily: 'Jockey One',
                  Fontweight: FontWeight.w400,
                  fontSize: 126),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(
                  Label: "Welcome, New User ",
                  FontFamily: 'Karla',
                  Fontweight: FontWeight.w700,
                  fontSize: 36),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(
                  Label: "You may create your account ",
                  FontFamily: 'Karla',
                  Fontweight: FontWeight.w100,
                  fontSize: 23),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: signupformkey,
                child: InputTextArea(
                  height: media.height * 0.50,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25, right: 20),
                      child: Column(
                        children: [
                          MyInputTextField(
                            Label: "Full-Name",
                            Text: FullNameController,
                            valid: (value) {
                              if (value!.isEmpty || !RegExp(r'^[a-zA-Z]{2,}$').hasMatch(value)) {
                                return "Invalid Entry";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          MyInputTextField(
                            Label: "Email",
                            Text: EmailSignUpController,
                            valid: (value) {
                              if (value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return "Invalid Entry";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          MyInputTextField(
                            Label: "Password",
                            Text: PasswordSignupController,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "Password must not be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          MyInputTextField(
                            Label: "Re-enter Password",
                            Text: ReEnterPasswordController,
                            valid: (value) {
                              if (value != PasswordSignupController.text) {
                                return "Passwords do not match";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Already Have An Account?Sign-in",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5000000059604645),
                                    fontSize: 13,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150),
            child: na?button(
              Label:"Sign-Up" ,
              function: () {
                setState(() {
                  na= false;
                  
                });
                if (signupformkey.currentState!.validate()) {
             try{
            
              db.signUpUser(FullNameController.text,EmailSignUpController.text, 
               PasswordSignupController.text,FurtherQuestions1Screen(),context
                );
                
                  Timer(Duration(seconds: 3), () { 
                    setState(() {
                  na= true;
                  
                });
                  });
                  
                

             }
             catch(error){
             
              showDialog(
    context: context,
    builder: (context) => WarningDialog(DialogQuestion: "An Error Has Occured While Signing in")
  );
  
             }     

             
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
            ):CircularProgressIndicator(color: Colors.white,),
          ),
          SizedBox(height: 30,),
          
        ],
      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}
