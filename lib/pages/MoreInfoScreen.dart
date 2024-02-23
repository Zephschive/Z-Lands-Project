import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

class MoreInfoScreen extends StatelessWidget {
  final String tappedEmail;
  MoreInfoScreen({Key? key, required this.tappedEmail});

  @override
  Widget build(BuildContext context) {
    DB_help DB = DB_help();

    return FutureBuilder<Map<String, dynamic>?>(
      future: DB.getUserData(tappedEmail), // Assuming this method fetches user data based on email
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()),); // Show a loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          Map<String, dynamic> userData = snapshot.data!;

          String nameOfTheUser = userData['Fullname'] ?? ''; // Replace 'Name' with the actual key in your database
          String area = userData['Area'] ?? '';
          var mobile = userData['Mobile Phone Number'] ?? '';
          //String coordinates = userData['Coordinates'] ?? '';

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
          MaterialPageRoute(
            builder: (context) => MainDashboard(),));
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    hoverColor: Colors.white.withOpacity(0.15),
                  ),
                  SizedBox(width: 20),
                  textArea(Label: 'More Info', FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 36),
                ],
              ),
              automaticallyImplyLeading: false,
            ),
            backgroundColor: ZColors.screencolor,
            body: ListView(
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Mapbox(),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/man.png'),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: textArea(Label:nameOfTheUser, FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 36),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        children: [
                          textArea(Label: "Area:", FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 22),
                          SizedBox(width: 28),
                          textArea(Label: area, FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 22),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          textArea(Label: "Full-Name:", FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 22),
                          SizedBox(width: 28),
                          textArea(Label: nameOfTheUser, FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 22),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          textArea(Label: "Mobile Phone:", FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 22),
                          SizedBox(width: 28),
                          textArea(Label: mobile.toString(), FontFamily: 'Karla Light', Fontweight: FontWeight.w700, fontSize: 22),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('No data available');
        }
      },
    );
  }
}
