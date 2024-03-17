import 'package:flutter/material.dart';

class MyInputTextField extends StatelessWidget {
  String Label;
  TextEditingController Text ;
  var valid;
  MyInputTextField({super.key,required this.Label,required this.Text,required this.valid});

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Material( 
            type: MaterialType.transparency,
            child: TextFormField
            (
              
             validator: valid,
              controller: Text,
            decoration: InputDecoration(
              
            hintText: Label,
            hintStyle: TextStyle(
              fontSize: 23,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.3400000035762787),
            )
            ),
        
            )
          ),
        );
  }
}