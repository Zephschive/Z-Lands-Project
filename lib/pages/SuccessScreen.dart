import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
         Padding(padding: const EdgeInsets.all(8),
         child: Column(
          children: [
            textArea(Label: "Z-LANDS", FontFamily: 'Jockey One', Fontweight: FontWeight.w400, fontSize: 126)
            ,SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left:20, ),
              child: textArea(Label: "Great, Your personal and land information has been submitted for further review. \nWe would get back to you soon", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25),
            ),
            SizedBox(height: 30,),
            Image(image: AssetImage("assets/img/check.png")),
            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(left: 80,right: 70,)
            
            ,child: button(Label: 'Okay,Go to my dashboard', function: (){}, ZColors: ZColors.buttonColorgreen),
            )
            ,SizedBox(height: 30,)
          ],
         ),
         )
        ],
      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}