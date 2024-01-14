import 'package:flutter/material.dart';

class button extends StatelessWidget {
 String Label;
 VoidCallback function;
 Color ZColors;
 button({super.key,required this.Label,required this.function,required this.ZColors});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: function,
    minWidth: 172,
    height: 50,
    color: ZColors,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    child: Text(Label, style: TextStyle(
      fontFamily: 'Karla',
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w100,
      
    ),),
    );
        
  
  }
}