import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

class MessageSuccessScreen extends StatelessWidget {
  const MessageSuccessScreen
({super.key});

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
              padding: const EdgeInsets.only(left:22, ),
              child: textArea(Label: "Wonderful, We have received your \n message we  would get\n back to you soon. \nThank you ", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 30),
            ),
            SizedBox(height: 30,),
            Image(image: AssetImage("assets/img/check.png")),
            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(left: 80,right: 70,)
            
            ,child: button(Label: 'Okay,Go to my dashboard', function: (){Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainDashboard(),));

            }, ZColors: ZColors.buttonColorgreen),
            )
            ,SizedBox(height: 30,)
          ],
         ),
         )
        ],
      ),
      backgroundColor: ZColors.screencolor,
    );;
  }
}