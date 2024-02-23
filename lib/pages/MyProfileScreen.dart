import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/ContactUs.dart';
import 'package:zlandsfrontend/pages/LoginScreen.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  DB_help DB = DB_help();
  String? fullName;
  String? area;
  String? status;
  String? coordinates;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final currentEmail = DB.Authen.currentUser?.email;
    if (currentEmail != null) {
      final userData = await DB.getUserData(currentEmail);
      if (userData != null) {
        setState(() {
          fullName = userData['Fullname'];
          area = userData['Area'];
          status = "";
          coordinates = "";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainDashboard()),
                );
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              hoverColor: Colors.white.withOpacity(0.15),
            ),
            SizedBox(width: 20),
            textArea(
              Label: 'My Profile',
              FontFamily: 'Karla Light',
              Fontweight: FontWeight.w700,
              fontSize: 36,
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: ZColors.screencolor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Mapbox(),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/img/man.png')],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: textArea(
              Label: "$fullName",
              FontFamily: 'Karla',
              Fontweight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    textArea(
                      Label: "Area: $area",
                      FontFamily: 'Karla Light',
                      Fontweight: FontWeight.w700,
                      fontSize: 22,
                    ),
                    SizedBox(width: 28),
                    
                  ],
                ),SizedBox(height: 30),Row(
                      children: [
                        textArea(
                          Label: "Status: $status",
                          FontFamily: 'Karla Light',
                          Fontweight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ],
                    ),
                SizedBox(height: 30),
                Row(
                  children: [
                    textArea(
                      Label: "Coordinates: $coordinates",
                      FontFamily: 'Karla Light',
                      Fontweight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 25),
                    button(
                      Label: "Generate My Report",
                      function: () {},
                      ZColors: ZColors.buttonColorblue,
                    ),
                    SizedBox(height: 25),
                    button(
                      Label: "Contact Us",
                      function: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactUsScreen(),
                          ),
                        );
                      },
                      ZColors: ZColors.buttonColorblue,
                    ),
                    SizedBox(height: 25),
                    button(
                      Label: "Sign-Out",
                      function: () {
                        DB.signout(context, LoginScreen());
                      },
                      ZColors: ZColors.buttonColorred,
                    ),
                  ],
                ),
                SizedBox(height: 60)
              ],
            ),
          )
        ],
      ),
    );
  }
}
