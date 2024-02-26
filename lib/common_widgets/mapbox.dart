import 'package:flutter/material.dart';
import 'package:zlandsfrontend/google_map.dart';

class Mapbox extends StatefulWidget {
   Mapbox({super.key, required this.widget});
   Widget widget;

  @override
  State<Mapbox> createState() => _MapboxState();
}

class _MapboxState extends State<Mapbox> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
    width: media.width*0.9,
    height: media.height*0.4,
    child: widget,
);
  }
}