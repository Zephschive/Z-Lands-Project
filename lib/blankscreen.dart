import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/Landspopup.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';


class blank extends StatefulWidget {
  const blank({super.key});

  @override
  State<blank> createState() => _blankState();
  
}

class _blankState extends State<blank> {
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
    width: media.width * 0.5,
    height: media.height * 0.5,
    
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ZColors.LinearGradienColors,
            
        ),
    ),
    child: Center(
child: blank()
    ),
);
  }
}