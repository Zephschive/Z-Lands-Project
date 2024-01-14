import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/color_ext.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/pages/MappingScreen.dart';

class NoteBeSureScreen extends StatelessWidget {
  const NoteBeSureScreen({super.key});

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
              child: textArea(Label: "Please kindly make sure when you purchase a land you register the mappings here, You can do so by going to the profile and tap on start mapping, Thank You. ", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25),
            ),
            SizedBox(height: 30,),
            Image(image: AssetImage("assets/img/smle.png")),
            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.only(left: 80,right: 70,)
            
            ,child: button(Label: 'Okay,Go to my dashboard', function: (){
              Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MappingLand(),));
            }, ZColors: ZColors.buttonColorgreen),
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