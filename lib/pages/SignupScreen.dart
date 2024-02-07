import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/MyInputTextfield.dart';

import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/pages/FurtherQuestionsScreen1.dart';
import 'package:zlandsfrontend/pages/LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController FullNameController = TextEditingController();
  TextEditingController EmailSignUpController = TextEditingController();
  TextEditingController PasswordSignupController= TextEditingController();
  TextEditingController ReEnterPasswordController = TextEditingController();
  final signupformkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    print(media.height*0.52);
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
              textArea(Label: "Welcome, New User ", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 36),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "You may create your account ", FontFamily: 'Karla', Fontweight: FontWeight.w100, fontSize: 23),

            ],

          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: InputTextArea(height: media.height*0.55, 
                children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 25,right: 20),
                          child: Column(
                            children: [
                              MyInputTextField(Label: "Full-Name", Text: FullNameController,valid:  (value){
                   if(value!.isEmpty || !RegExp(r'^[a-zA-Z\u00C0-\u024F\-\]{2,}$').hasMatch(value!)){
                    return "Invalid Entry";
                   }else{return null;}
                      },),
                              SizedBox(height: 20,),
                              MyInputTextField(Label: "Email", Text: EmailSignUpController,valid:  (value){
                                if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)){
                    return "Invalid Entry";
                   }else{return null;}
                   
                      }),
                             SizedBox(height: 20,),
                              MyInputTextField(Label: "Password", Text: PasswordSignupController,valid:  (value){
                   
                      }),
                              SizedBox(height: 20,),
                              MyInputTextField(Label: "Re-enter Password", Text: ReEnterPasswordController,valid:  (value){
                   
                      }),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: (){Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),));},
                                    child: Text("Already Have An Account?Sign-in",
                                    style: TextStyle(
                                    color: Colors.black.withOpacity(0.5000000059604645),
                                    fontSize: 13,
                                    fontFamily: 'Jost',
                                    fontWeight: FontWeight.w400,
                                  )
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
            Padding(padding: const EdgeInsets.only(left: 150,right: 150),child: button(Label: "Sign-Up", function: (){
             
             Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => FurtherQuestions1Screen(),));
              
              }, ZColors: ZColors.buttonColorblue),)
            ,SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textArea(Label: "Or Sign-Up with Google", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 22),
              ],
            ),
             Padding(
            padding: const EdgeInsets.only(top: 2,left:50,right: 50,bottom: 20),
            child: bluebuttonWithGoogle(Label: "Sign-Up", function: (){}),
          ),
          SizedBox(height: 30,)
        ],

      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}