import 'package:flutter/material.dart';

import 'common_widgets.dart';

class CustomDialog extends StatelessWidget {
  String DialogQuestion;
  String DialogButtonLeftText;
  VoidCallback DialogButtonLeftFunction;
  String DialogButtonRightText;
  VoidCallback DialogButtonRightFunction;
  CustomDialog({required this.DialogQuestion,required this.DialogButtonLeftText,required this.DialogButtonLeftFunction,required this.DialogButtonRightText,required this.DialogButtonRightFunction});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                DialogQuestion,
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
            width: media.width/3,
            child: button(Label: DialogButtonLeftText, function: DialogButtonLeftFunction, ZColors: ZColors.buttonColorred)),
          Container(
            width: media.width/3,
            child: button(Label: DialogButtonRightText, function: DialogButtonRightFunction, ZColors: ZColors.buttonColorgreen))

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
