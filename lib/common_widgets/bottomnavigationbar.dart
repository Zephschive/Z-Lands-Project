import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/color_ext.dart';
import 'package:zlandsfrontend/pages/MyProfileScreen.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

class bottomnavigation extends StatefulWidget {
  const bottomnavigation({super.key});

  @override
  State<bottomnavigation> createState() => _bottomnavigationState();
}

class _bottomnavigationState extends State<bottomnavigation> {
  int MyIndex =0;
  List<Widget> widgetList = const [MainDashboard(),MyProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[MyIndex],
      bottomNavigationBar:BottomNavigationBar(
        iconSize:25,
        backgroundColor: Color.fromARGB(1, 129, 129, 129),
        type: BottomNavigationBarType.shifting,
        currentIndex: MyIndex,
      
        onTap: (index)
        {
          setState(() {
            MyIndex=index;
          });
        },
        items: const [
         BottomNavigationBarItem(icon:Icon(Icons.home) ,
         label: 'Dashbord',
          
         backgroundColor: Colors.grey ,
         ),
         BottomNavigationBarItem(icon:Icon(Icons.person) ,
         label: 'My Profile',
          backgroundColor: Colors.grey,
         ),
         
                  ],
      ),
    );
  }
}