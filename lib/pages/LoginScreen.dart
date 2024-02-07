import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/MyInputTextfield.dart';
import 'package:zlandsfrontend/common_widgets/color_ext.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal, ),
          padding: EdgeInsets.only(left: 10),
          children: [
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
                    child: MyInputTextField(Label: "Password", Text: PasswordController,valid:  (value){
                   
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
                        onTap: (){}, 
                        
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
            child: button(Label: "Sign-In", function: (){ 
              if(formkey.currentState!.validate()){
             Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => MainDashboard(),));
              }else{
                print("nope");
              }
              
          
          }, ZColors: ZColors.buttonColorblue),
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
            child: bluebuttonWithGoogle(Label: "Sign-in", function: (){}),
          
          )
          ],
        ),
      backgroundColor: ZColors.screencolor,
    );
  }
}