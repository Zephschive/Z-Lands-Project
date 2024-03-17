import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zlandsfrontend/blankscreen.dart';
import 'package:zlandsfrontend/common_widgets/MyInputTextfield.dart';
import 'package:zlandsfrontend/common_widgets/color_ext.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/Forgottenpassword.dart';
import 'package:zlandsfrontend/pages/SignupScreen.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  final formkey =GlobalKey<FormState>();
  DB_help db = DB_help();
  bool na = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal, ),
          padding: EdgeInsets.only(left: 10),
          children: [
            SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "Z-LANDS", 
              FontFamily: 'Jockey One', 
              Fontweight: FontWeight.w400, 
              fontSize: 126),
            ],
          ),

          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "Welcome", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize:36 ),
            ],
          ), SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label:"You may sign-in to your account" , FontFamily: 'Karla', Fontweight: FontWeight.w400, fontSize: 23),
            ],
          ),
            SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Form(
                key: formkey,
                child: InputTextArea(height: 236, children:[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MyInputTextField(Label: "Email", Text: EmailController,valid: (value){
                   if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)){
                    return "Please Enter A Correct Email Address";
                   }else{return null;}
                      },)                ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MyInputTextField(
                      
                      Label: "Password", Text: PasswordController,valid:  (value){
                   
                      }),
                        
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),));
                        },
                        child: Text("  New User?Create New Account",
                        style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 13,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400,
                      
              ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                           Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => ForgottenPassScreen(),));
                        }, 
                        
                        child: Text("Forgotten Passowrd?  ",
                        style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 13,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400,
                      
              ),
                        ),
                      )
                    ],
                  )
                  
                ]),
              )
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 25,left:120,right: 120),
            child: na?button(Label: "Sign-In", function: (){ 
               setState(() {
                  na= false;
                  
                });
                if (formkey.currentState!.validate()) {
             try{
            
              db.signUserIn(EmailController.text, 
                PasswordController.text,MainDashboard(),context
                );
                
                  Timer(Duration(seconds: 15), () { 
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
          
          }, ZColors: ZColors.buttonColorblue) :SizedBox(height: 120,width: 120, child: CircularProgressIndicator( color: Colors.white,)),
          ),
          SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textArea(Label: "Or Sign-in with Google", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 22),
              ],
            ),
            SizedBox(height: 10,),
             Padding(
            padding: const EdgeInsets.only(top: 2,left:50,right: 50,bottom: 20),
            child: bluebuttonWithGoogle(Label: "Sign-in", function: (){
              db.signinwithGoogle(context, MainDashboard());
              //db.signout(context, LoginScreen());
            }),
          
          )
          ],
        ),
      backgroundColor: ZColors.screencolor,
    );
  }
}