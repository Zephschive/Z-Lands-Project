import 'dart:async';

import 'package:flutter/material.dart';

import 'common_widgets.dart';

class LoadingDialog extends StatelessWidget {
  Widget screen;
  int seconds;
  LoadingDialog({super.key,required this.screen,required this.seconds});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    Timer(Duration(seconds: seconds), (){
      Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => screen,));
    });
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 250,
              alignment: Alignment.center,
              child: Text(
                "Loading",
                style: TextStyle(fontSize: 20.0,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w700,
                
              
                ),
              ),
            ),
            SizedBox(height: 20.0),
             Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            
            child: CircularProgressIndicator(color:Colors.blue)),
         

        ],
      ),
      SizedBox(
        height: 30,
      )
          ]
        ),
      ),
    );
  }
}
