import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';


class MappingLand extends StatefulWidget {
  const MappingLand({super.key});

  @override
  State<MappingLand> createState() => _MappingLandState();
}

class _MappingLandState extends State<MappingLand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          SizedBox(height: 40,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            textArea(Label: "Mapping Land", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 36)
          ],),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textArea(Label: "  Walk around your land ,  ", 
                    FontFamily: 'Karla Light', 
                    Fontweight: FontWeight.w400, 
                    fontSize: 25)
                  ],
                ),
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "make sure you hit the", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "plus button after every ", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: " corner", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25)
            ],
          )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Mapbox(),
          ),
        SizedBox(height: 30,),
     IconButton(onPressed:(){}, icon: Image.asset("assets/img/add.png"),
     
     ),
     SizedBox(height: 40,),
      Padding(
        padding: const EdgeInsets.only(left:30,),
        child: textArea(Label: "COORDINATES:", 
        FontFamily: 'Karla Light', 
        Fontweight: FontWeight.w400, 
        fontSize: 25),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 356,
          height: 192,
          decoration: ShapeDecoration(
          color: Color(0xFF828181),
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(19),
          ),
          shadows: [
              BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
              )
          ],
          ),
      ),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          button(Label: "Reset", function: (){}, ZColors: ZColors.buttonColorblue),
          button(Label: "All Done", function: (){ 
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(DialogQuestion: "Are you sure you are done" , DialogButtonLeftText: "Not Quite", DialogButtonLeftFunction:(){}, DialogButtonRightText: "All done", DialogButtonRightFunction: (){}); 
                },
              );
            
            
            }, ZColors: ZColors.buttonColorgreen)

        ],
      ),
      SizedBox(
        height: 30,
      )

        ],
      ) ,
      backgroundColor: ZColors.screencolor,
    );
  }
}