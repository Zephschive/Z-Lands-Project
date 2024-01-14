import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/MyInputTextfield.dart';

import 'package:zlandsfrontend/common_widgets/color_ext.dart';


class InputTextArea extends StatelessWidget {
  double height;
  List<Widget>children;
  InputTextArea({super.key,required this.height,required this.children});


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
    width: media.width* 0.9,
    height:height,
    decoration: ShapeDecoration(
        color: ZColors.textinputarea,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(39),
        ),
        shadows: [
            BoxShadow(
                color: Color(0x4F000000),
                blurRadius: 11,
                offset: Offset(3, 4),
                spreadRadius: 10,
            )
        ],
    ),
    child: Column
    (
     
      children: 
        children,
      
    ),
);
  }
}