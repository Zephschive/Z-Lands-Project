import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/color_ext.dart';

class bluebuttonWithGoogle extends StatelessWidget {
 String Label;
 VoidCallback function;
 bluebuttonWithGoogle({super.key,required this.Label,required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      child: MaterialButton(onPressed: function,
      minWidth: 172,
      height: 50,
      color: ZColors.buttonColorblue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      child: Row(  
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image(image: const AssetImage("assets/img/chrome.png") ,height: 25,width: 25,),
        SizedBox(width: 10,),
          Text(Label, style: TextStyle(
            fontFamily: 'Karla',
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w100,
            
          ),),
        ],
      ),
      ),
    );
        
  
  }
}