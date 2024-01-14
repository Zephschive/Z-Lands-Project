import 'package:flutter/material.dart';

class Mapbox extends StatefulWidget {
  const Mapbox({super.key});

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
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/img/dummymap.png"),
            fit: BoxFit.fill,
        ),
    ),
);
  }
}