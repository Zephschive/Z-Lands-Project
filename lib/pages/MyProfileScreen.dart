import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/ContactUs.dart';
import 'package:zlandsfrontend/pages/LoginScreen.dart';
import 'package:zlandsfrontend/pages/MappingScreen.dart';
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
  late String? _email = DB.Authen.currentUser?.email;
  GoogleMapController? _googleMapController;
   final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
      List<Marker> _manyMarker=[];
      List<Polyline>_polylines=[];
      List<Circle> _manyCircle=[];
      List<LatLng> _points = [];


  


  static const CameraPosition _kGooglePlex = 

  CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Marker _marker = Marker(markerId: MarkerId('Marker 1'),
        
        
        draggable: true
  );

  

  void _addmarker (LatLng markerpoints) {
 setState(() {

              
              _manyMarker.add(Marker(markerId: MarkerId('Marker ${_manyMarker.length}'),
        position:  LatLng(markerpoints.latitude,markerpoints.longitude),
        infoWindow: InfoWindow(title: 'GOOGLE PLEX ${_manyMarker.length}',snippet: 'Latitude is ${markerpoints.latitude}, longitude iS ${markerpoints.longitude} '),
        draggable: true
              ));
 });

  }
  
  
  @override
  void initState() {
    super.initState();
    fetchUserData();
    fetchMappUserData().then((_) {
    if (_points.isNotEmpty) {
      moveCameraToFirstPoint();
    }
  }).catchError((error) {
    print('Error fetching user data: $error');
  });
  _email = DB.Authen.currentUser?.email;
  }

  Future<void> fetchUserData() async {
    final currentEmail = DB.Authen.currentUser?.email;
    if (currentEmail != null) {
      final userData = await DB.getUserData(currentEmail);
      if (userData != null) {
        setState(() {
          fullName = userData['Fullname'];
          area = userData['Area'];
          status = userData['status'];
          coordinates = "";
        });
      }
    }
  }

  
Future<void> fetchMappUserData() async {
  final currentEmail = DB.Authen.currentUser?.email;
  if (currentEmail != null) {
    final userData = await DB.getUserData(currentEmail);
    if (userData != null) {
      setState(() {
        final coordinatesString = userData['Coordinates'] as String;
        if (coordinatesString != null) {
          final regex = RegExp(r'LatLng\(([^,]+),\s([^)]+)\)');
          final matches = regex.allMatches(coordinatesString);
          _points = matches
              .map((match) => LatLng(
                    double.parse(match.group(1)!),
                    double.parse(match.group(2)!),
                  ))
              .toList();
              print(_points);
          // Clear _manyMarker before adding new markers
          _manyMarker.clear();
          // Create Marker objects from LatLng objects in _points
          // Clear _manyMarker before adding new markers
_manyMarker.clear();
// Create Marker objects from LatLng objects in _points
_manyMarker = _points.asMap().entries.map((entry) {
  final index = entry.key;
  final latLng = entry.value;
  return Marker(
    markerId: MarkerId('Marker $index'),
    position: latLng,
    infoWindow: InfoWindow(
      title: 'GOOGLE PLEX $index',
      snippet: 'Latitude is ${latLng.latitude}, longitude is ${latLng.longitude}',
    ),
    draggable: false,
  );
}).toList();

        }
      });
    }
  }
}

void moveCameraToFirstPoint() {
  try {
    if (_googleMapController != null && _points.isNotEmpty) {
      _googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _points.first,
            zoom: 18, // Adjust the zoom level as needed
          ),
        ),
      );
    }
  } catch (e) {
    print('Error moving camera: $e');
  }
}



 

 Future<String?> _getUserStatus(String email) async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('Email', isEqualTo: email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final userDocument = snapshot.docs.first.data();
        if (userDocument.containsKey('Coordinates')) {
          return userDocument['Coordinates'];
        } else {
          // If status field is not found
          return null;
        }
      } else {
        // If no document is found for the given email
        return null;
      }
    } else {
      // If user is not signed in
      return null;
    }
  } catch (e) {
    print('Error fetching user Coordinates: $e');
    return null;
  }
}




  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
  print(_points);
  print(_manyMarker);
   

bool na;
  if(_points.isNotEmpty)
  {
    na = true;
  }else{
    na= false;
  }

 Polygon manynotpolygon = Polygon(polygonId: PolygonId('Polygon ${_points.length}'),
  points:[LatLng(37.4219985, -122.0839999)],
  fillColor: Colors.transparent,
  strokeColor: Colors.red,
  strokeWidth: 2,
  );


  Polygon manypolygon = Polygon(polygonId: PolygonId('Polygon ${_points.length}'),
  points:_points,
  fillColor: Colors.red.shade100,
  strokeColor: Colors.red,
  strokeWidth: 2,
  geodesic: true,
  zIndex: 1
  );
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
            child: Container(
    width: media.width*0.9,
    height: media.height*0.4,
    child: _points.isNotEmpty
    ? GoogleMap(
        polygons: {
          manypolygon
        },
        markers: Set<Marker>.from(_manyMarker),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (controller) {
          _googleMapController = controller;
          if (_points.isNotEmpty) {
            _googleMapController!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: _points.first,
                  zoom: 18,
                ),
              ),
            );
          }
        },
        onTap: (position) async {},
      )
    : Center(
        child: Text(
          'No coordinates available yet',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),

) //mapbox,
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
                        Row(
                          children: [
                            textArea(
                              Label: "Status: ",
                              FontFamily: 'Karla Light',
                              Fontweight: FontWeight.w700,
                              fontSize: 22,
                            ),
                            textArea(
                              Label: "'"+"$status"+"'",
                              FontFamily: 'Karla',
                              Fontweight: FontWeight.w900,
                              fontSize: 22,
                            )
                          ],
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
                FutureBuilder<String?>(
        future: _getUserStatus(_email ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  CircularProgressIndicator(color: Colors.white10);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            String status = snapshot.data ?? '';
            if (status.isNotEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                    padding: EdgeInsets.only(left: 50,right: 50),
                    child: button(
                            Label: "Already Done Mapping ",
                            function: () {
                               Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainDashboard(),
                                ),
                              );
                            },
                            ZColors: ZColors.gray,
                          ),
                  ),
                ],
              );
            } else {
              return button(
                      Label: "Go To Mapping Page",
                      function: () {
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MappingLand(),
                          ),
                        );
                      },
                      ZColors: ZColors.buttonColorblue,
                    );
            }
          }
        },
      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ SizedBox(height: 25),
                    
                    SizedBox(height: 25),
                    
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
