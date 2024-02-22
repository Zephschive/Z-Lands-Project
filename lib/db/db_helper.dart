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

  
void AddFurtherDetails(String Mobile,String IDNumber,String PostalAddress,String Region,String Area,BuildContext context,Widget screen)async
{
  //   final current = FirebaseAuth.instance.currentUser;
  // FireDB.collection('Users').where('Email',isEqualTo: current!.email.toString()).add({
  //   'Mobile Phone Number':Mobile,
  //   'ID Number':IDNumber,
  //   'Postal Address':PostalAddress,
  //   'Region':Region,
  //   'Area':Area
  // }).catchError((error, stackTrace) =>showDialog(context: context, builder: (context)=>WarningDialog(DialogQuestion: error.toString()))).then((value) =>  Navigator.pushReplacement(
  //          context,
  //          MaterialPageRoute(
  //          builder: (context) => screen,)));

Future<void> updateUserData(String userEmail, Map<String, dynamic> newData) async {
  try {
    // Query the collection 'Users' for documents where 'Email' field matches the user's email
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: userEmail)
        .get();

    // Check if any documents are found
    if (querySnapshot.docs.isNotEmpty) {
      // Assuming there's only one document found, you can directly access its reference
      DocumentReference userDocRef = querySnapshot.docs.first.reference;

      // Update the document with the new data
      await userDocRef.update(newData);

      print('User data updated successfully');
    } else {
      // No document found with the provided email
      print('No user found with the provided email');
    }
  } catch (error) {
    print('Error updating user data: $error');
  }
}
final current = FirebaseAuth.instance.currentUser;
String userEmail = current!.email.toString();
Map<String, dynamic> newData = {
  'Mobile Phone Number': Mobile,
  'ID Number': IDNumber,
  'Postal Address': PostalAddress,
  'Region': Region,
  'Area': Area,
};

await updateUserData(userEmail, newData);


Navigator.pushReplacement(
         context,
            MaterialPageRoute(
       builder: (context) => screen,));

}


Future<String?> getUserName(String userEmail) async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: userEmail)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Assuming there's only one document found, you can directly access its data
      var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
      return userData['Fullname']; // Use null-aware operator (?)
    } else {
      return null; // No user found with the provided email
    }
  } catch (error) {
    print('Error getting user name: $error');
    return null;
  }
}



}