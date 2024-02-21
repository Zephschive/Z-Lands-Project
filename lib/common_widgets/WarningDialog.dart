import 'package:flutter/material.dart';

import 'common_widgets.dart';

class WarningDialog extends StatelessWidget {
  String DialogQuestion;
  WarningDialog({required this.DialogQuestion});
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
            child: button(Label: "Okay", function: (){Navigator.pop(context);}, ZColors: ZColors.buttonColorgreen)),
         

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
