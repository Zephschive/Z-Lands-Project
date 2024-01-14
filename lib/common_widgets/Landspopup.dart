import 'package:flutter/material.dart';

class Landspopup extends StatelessWidget {
  String Title;
 Landspopup({super.key,required this.Title});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
  
    return Container(
      child: Row(
        children: [
          Container(
            width: media.width*0.90,
    height: 61.30,
    decoration: ShapeDecoration(
    color: Color(0xFFD9D9D9),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    shadows: [
    BoxShadow(
    color: Color(0x3F000000),
    blurRadius: 42,
    offset: Offset(0, 4),
    spreadRadius: 8,
    )
    ],
    ),
    child: Column(
      children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              Title,
              style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Sofia Pro',
              fontWeight: FontWeight.w600,
              height: 0,
              decoration: TextDecoration.none
              ),),
          ),
        ],
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: GestureDetector(
              onTap: () {
              },
              child: Text(
              'Tap here to view more',
              style: TextStyle(
              color: Colors.black.withOpacity(0.41999998688697815),
              fontSize: 14,
              fontFamily: 'Sofia Pro',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
              height: 0,
                ),),
            )
          ),
        ],
      ),
   
      ],
    ),

          ),
          
        ],
      
      ),
    );
  }
}