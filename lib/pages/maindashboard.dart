import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/color_ext.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/pages/MyProfileScreen.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
   int MyIndex =0;
  List<Widget> widgetList = const [MainDashboard(),MyProfileScreen()];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent ,
        toolbarHeight: 150,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                textArea(Label: 'WELCOME', FontFamily: 'Sofia Pro', Fontweight: FontWeight.w600, fontSize: 40),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                textArea(Label: 'Dashboard', FontFamily: 'Sofia Pro', Fontweight: FontWeight.w600, fontSize:22),
              ],
            )
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF818181),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(54),
            ),
          boxShadow: [
BoxShadow(
color: Color(0x3F000000),
blurRadius: 16,
offset: Offset(0, 4),
spreadRadius: 19,
)
],
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 25,),
          Row(
            children: [
              SizedBox(width: 20,),
              textArea(Label: "Registered Lands Around You", FontFamily: "Sofia Pro", Fontweight: FontWeight.w300, fontSize: 22),
            ],
          ),
          SizedBox( height: 30,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
                Padding(
            padding: const EdgeInsets.only(left:15.0,right: 10,bottom:20),
            child: Landspopup(Title: "Ollennu's Residence",),
          ),
          Padding(
            padding: const EdgeInsets.only(left:15.0,right: 10,bottom:20),
            child: Landspopup(Title: "Ollennu's Residence",),
          ) ,
            Padding(
            padding: const EdgeInsets.only(left:15.0,right: 10,bottom:20),
            child: Landspopup(Title: "Ollennu's Residence",),
          )
          ,Padding(
            padding: const EdgeInsets.only(left:15.0,right: 10,bottom:20),
            child: Landspopup(Title: "Ollennu's Residence",),
          )
            ],
          ),
        ],
      ),
      backgroundColor: ZColors.screencolor,
      bottomNavigationBar:BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize:25,
        backgroundColor: Color.fromARGB(1, 129, 129, 129),
        type: BottomNavigationBarType.shifting,
        currentIndex: MyIndex,
      
        onTap: (index)
        {
          setState(() {
            MyIndex=index;
            if(MyIndex ==1 ){
              Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyProfileScreen(),));
            }
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