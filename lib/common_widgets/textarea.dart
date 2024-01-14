import 'package:flutter/material.dart';

class textArea extends StatelessWidget {
   textArea({super.key,required this.Label,required this.FontFamily,required this.Fontweight, required this.fontSize});
   String Label;
   double fontSize;
   String FontFamily;
   FontWeight Fontweight;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Label,style: 
      TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontFamily: FontFamily,
        fontWeight: Fontweight
      ),),
    )
    ;
  }
}