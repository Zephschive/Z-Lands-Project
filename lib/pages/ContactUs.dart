import 'package:flutter/material.dart';

import '../common_widgets/common_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
   
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back ,color: Colors.white, size: 30,),hoverColor:Colors.white.withOpacity(0.15) )
            ,SizedBox(width: 20,),
            textArea(Label: 'Contact Us', FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 36)
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: ZColors.screencolor,
      body: ListView(
        children: [
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: media.width*0.75,
                child: textArea(Label: 'Send us your feedback', FontFamily: 'Karla Light', Fontweight: FontWeight.w200, fontSize: 40)),
            ],
          ),
          SizedBox(height: 75,),
          Padding(padding:const EdgeInsets.only(left: 50),
          child: textArea(Label: 'Name', FontFamily:'Karla' , Fontweight: FontWeight.w700, fontSize: 22),)
        ,SizedBox(
          height: 20,
        ),
        Padding(padding: const EdgeInsets.only(left:45,right: 45),
        child: Container(
    width: 366,
    height: 52,
    decoration: ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
        ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left:15.0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Enter your name ',hintStyle:  TextStyle(
    color: Color(0x701E1E1E),
    fontSize: 22,
    fontFamily: 'Karla',
    fontWeight: FontWeight.w700,
    height: 0,
    ),
        ),
    
      ),
    ),
),
        
        ),
        SizedBox(height: 60,),
         Padding(padding:const EdgeInsets.only(left: 50),
          child: textArea(Label: 'Subject', FontFamily:'Karla' , Fontweight: FontWeight.w700, fontSize: 22),)
        ,SizedBox(
          height: 20,
        ),
        Padding(padding: const EdgeInsets.only(left:45,right: 45),
        child: Container(
    width: 366,
    height: 52,
    decoration: ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
        ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left:15.0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Enter your subject ',hintStyle:  TextStyle(
    color: Color(0x701E1E1E),
    fontSize: 22,
    fontFamily: 'Karla',
    fontWeight: FontWeight.w700,
    height: 0,
    ),
        ),
    
      ),
    ),
),
        
        ),
        SizedBox(height: 60,)
        ,
         Padding(padding:const EdgeInsets.only(left: 50),
          child: textArea(Label: 'Message', FontFamily:'Karla' , Fontweight: FontWeight.w700, fontSize: 22),)
        ,SizedBox(
          height: 20,
        ),
        Padding(padding: const EdgeInsets.only(left:45,right: 45),
        child: Container(
    width: 366,
    height: 52,
    decoration: ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
        ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left:15.0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Enter your message ',hintStyle:  TextStyle(
    color: Color(0x701E1E1E),
    fontSize: 22,
    fontFamily: 'Karla',
    fontWeight: FontWeight.w700,
    height: 0,
    ),
        ),
    
      ),
    ),
),
        
        ),
        SizedBox(height: 80,),
        Padding(
          padding: const EdgeInsets.only(left:120.0,right: 120),
          child: button(Label: 'Send Message', function: (){}, ZColors: ZColors.buttonColorblue),
        ),
         SizedBox(height: 30,),
        ],
         
      ),
    );
  }
}