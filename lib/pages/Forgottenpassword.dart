import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zlandsfrontend/blankscreen.dart';
import 'package:zlandsfrontend/common_widgets/MyInputTextfield.dart';
import 'package:zlandsfrontend/common_widgets/color_ext.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/LoginScreen.dart';
import 'package:zlandsfrontend/pages/SignupScreen.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

class ForgottenPassScreen extends StatefulWidget {
  const ForgottenPassScreen({super.key});

  @override
  State<ForgottenPassScreen> createState() => _ForgottenPassState();
}

class _ForgottenPassState extends State<ForgottenPassScreen> {
  TextEditingController ForgottenEmailController = TextEditingController();

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

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label:"A link would be sent to  you to \n            reset the password" , FontFamily: 'Karla', Fontweight: FontWeight.w400, fontSize: 23),
            ],
          ),SizedBox(height: 20,),Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label:"Enter your email address" , FontFamily: 'Karla', Fontweight: FontWeight.w400, fontSize: 23),
            ],
          ),
            SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Form(
                key: formkey,
                child: InputTextArea(height: 120, children:[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: MyInputTextField(Label: "Email", Text: ForgottenEmailController,valid: (value){
                   if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)){
                    return "Please Enter A Correct Email Address";
                   }else{return null;}
                      },)
                      ),
                
                ]),
              )
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 25,left:50,right: 50),
            child: na?button(Label: "Reset Password", function: (){ 
               setState(() {
                  na= false;
                  
                });
                if (formkey.currentState!.validate()) {
             try{
            
            db.ResetPassword(ForgottenEmailController.text,LoginScreen(),context);
           
      
          
                
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
            
            SizedBox(height: 10,),
            
          
          
          ],
        ),
      backgroundColor: ZColors.screencolor,
    );
  }
}