import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';

class DB_help{

    FirebaseAuth Authen = FirebaseAuth.instance;

    FirebaseFirestore FireDB = FirebaseFirestore.instance;

 void signinwithGoogle(BuildContext context,Widget screen) async{
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await guser!.authentication;

    final cred= GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
   

   await FirebaseAuth.instance.signInWithCredential(cred).then((value) =>  Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => screen,)));
   

   }



     void signUserIn(String EmailController,String PasswordController,Widget screen ,BuildContext context) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController, password: PasswordController).catchError((error, stackTrace) => showDialog(context: context, builder: (context)=>WarningDialog(DialogQuestion: error.toString())))
  .then((value) => Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => screen,)));

  
  }


  void signout(BuildContext context, Widget screen) async{
      await FirebaseAuth.instance.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) { return screen;})));
    } 

    void signUpUser(String Fullname,String EmailController,String PasswordController,Widget screen ,BuildContext context) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: EmailController, password: PasswordController).catchError((error, stackTrace) => showDialog(context: context, builder: (context)=>WarningDialog(DialogQuestion: error.toString())))
  .then((value) =>FirebaseFirestore.instance.collection('Users').add({
    'Fullname':Fullname,
    'Email':EmailController,
    'password':PasswordController,
  }).catchError((errorr, stackTrace) =>(){
    
    showDialog(context: context, builder: (context)=>WarningDialog(DialogQuestion: errorr.toString()));}  ).then((value) => Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => screen,))));

  
  }

  
void AddFurtherDetails(int Mobile,String IDNumber,String PostalAddress,String Region,String Area,BuildContext context,Widget screen)async
{
  FireDB.collection('Users').add({
    'Mobile Phone Number':Mobile,
    'ID Number':IDNumber,
    'Postal Address':PostalAddress,
    'Region':Region,
    'Area':Area
  }).catchError((error, stackTrace) =>showDialog(context: context, builder: (context)=>WarningDialog(DialogQuestion: error.toString()))).then((value) =>  Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => screen,)));
}


}