import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/LoadingDialog.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/MessageSuccesScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'dart:math';

import 'package:zlandsfrontend/pages/maindashboard.dart';

class MappingLand extends StatefulWidget {
  MappingLand({Key? key}) : super(key: key);

  @override
  State<MappingLand> createState() => _MappingLandState();
}

class _MappingLandState extends State<MappingLand> {
  final DB_help _db = DB_help();
  late final String? _email;

  @override
  void initState() {
    super.initState();
    _email = _db.Authen.currentUser?.email;
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
        if (userDocument.containsKey('status')) {
          return userDocument['status'];
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
    print('Error fetching user status: $e');
    return null;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
        future: _getUserStatus(_email ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.blue[900]));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            String status = snapshot.data ?? '';
            if (status == 'permitted') {
              return MappingLandPermitted();
            } else {
              return MappingLandNotPermitted();
            }
          }
        },
      ),
      backgroundColor: ZColors.screencolor,
    );
  }
}

class MappingLandPermitted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textArea(
              Label: "Mapping Land",
              FontFamily: 'Karla',
              Fontweight: FontWeight.w700,
              fontSize: 36,
            ),
          ],
        ),
        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
          child: button(
            Label: "Go To Map",
            function: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MapSample12()));
            },
            ZColors: ZColors.buttonColorblue,
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

class MappingLandNotPermitted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 40),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textArea(
              Label: "Mapping Land",
              FontFamily: 'Karla',
              Fontweight: FontWeight.w700,
              fontSize: 36,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: textArea(
                Label: "Dear User, \n you are not permitted to make \n coordinates on your land yet",
                FontFamily: 'Karla Light',
                Fontweight: FontWeight.w400,
                fontSize: 25,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right:8),
              child: textArea(
                Label: "Please contact the \nsystem administrators \nfor further instructions",
                FontFamily: 'Karla Light',
                Fontweight: FontWeight.w400,
                fontSize: 25,
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: ZColors.gray
            ),
           
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Icon(Icons.lock ,color: Colors.white),
                button(
                  Label: "Proceed",
                  function: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainDashboard()));
                  },
                  ZColors: ZColors.gray,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

class MapSample12 extends StatefulWidget {
  MapSample12({Key? key}) : super(key: key);

  @override
  State<MapSample12> createState() => MapSampleState12();
}

class MapSampleState12 extends State<MapSample12> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final DB_help _db = DB_help();
  List<Marker> _manyMarker = [];
  List<LatLng> _points = [];
  List<LatLng> _points2 = [];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );

  @override
  void initState() {
    super.initState();
    _goCurrentPosition1();
    _getCurrentLocation();
  }

  Future<void> _goCurrentPosition1() async {
    Position currentPosition = await getCurrentPosition();
    try {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 15,
            target: LatLng(currentPosition.latitude, currentPosition.longitude),
          ),
        ),
      );
      _addMarker(LatLng(currentPosition.latitude, currentPosition.longitude));
    } catch (e) {
      print('Error getting current position: $e');
    }
  }

  void _getCurrentLocation() async {
    try {
      Position currentPosition = await getCurrentPosition();
      setState(() {
        _goCurrentPosition1();
        _points.add(LatLng(currentPosition.latitude, currentPosition.longitude));
      });
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  void _addMarker(LatLng markerPoints) {
    setState(() {
      _manyMarker.add(
        Marker(
          markerId: MarkerId('Marker ${_manyMarker.length}'),
          position: LatLng(markerPoints.latitude, markerPoints.longitude),
          infoWindow: InfoWindow(
            title: 'GOOGLE PLEX ${_manyMarker.length}',
            snippet: 'Latitude is ${markerPoints.latitude}, longitude is ${markerPoints.longitude}',
          ),
          draggable: true,
        ),
      );
    });
  }
 Future<void> checkIntersection(List<LatLng> userPositions) async {
  try {
    // Retrieve positions of other users from the database
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('Users').get();

    // Track if intersection has been detected
    bool intersectionDetected = false;

    // Iterate through each user's positions
    snapshot.docs.forEach((doc) {
      if (doc.data().containsKey('Coordinates')) {
        final regex = RegExp(r'LatLng\(([^,]+),\s([^)]+)\)');
        final matches = regex.allMatches(doc['Coordinates'].toString());
        List<LatLng> otherUserPositions = matches
          .map((match) => LatLng(
            double.parse(match.group(1)!),
            double.parse(match.group(2)!),
          ))
          .toList();
          print(otherUserPositions);

        // Check for intersection with each position of the other user
        otherUserPositions.forEach((otherPosition) {
          // Compare each user's position with the new position
          userPositions.forEach((userPosition) {
            if (!intersectionDetected && isIntersecting(userPosition, otherPosition)) {
              intersectionDetected = true;
              // Intersection detected, prompt the user once
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Boundary Crossed'),
                    content: Text('You have crossed the boundaries of another user.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          });
        });
      }
    });
  } catch (e) {
    print('Error checking intersection: $e');
  }
}



// Function to check if two positions intersect or are in close proximity
bool isIntersecting(LatLng position1, LatLng position2) {
   print(position1);
   print()
   bool returnning=false; 
  if (position1.latitude == position2.latitude && position1.longitude == position2.longitude) {

    returnning=true;
  }
  print(returnning);
  // Calculate the distance between the positions
  return returnning;
}

// Function to calculate the distance between two LatLng positions
double calculateDistance(LatLng position1, LatLng position2) {
  // You can use the haversine formula or any other method to calculate distance
  // This is a simplified example using straight line distance
  double dx = position1.latitude - position2.latitude;
  double dy = position1.longitude - position2.longitude;
  return sqrt(dx * dx + dy * dy); // Here's the corrected usage of sqrt
}




  @override
  Widget build(BuildContext context) {
    bool na = _points.isNotEmpty;
    Polygon manypolygon = Polygon(
      polygonId: PolygonId('Polygon ${_points.length}'),
      points: _points,
      fillColor: Colors.red.shade100,
      strokeColor: Colors.red,
      strokeWidth: 2,
      geodesic: true,
      zIndex: 1,
    );

    Polygon manyNotPolygon = Polygon(
      polygonId: PolygonId('Polygon ${_points.length}'),
      points: [LatLng(37.4219985, -122.0839999)],
      fillColor: Colors.transparent,
      strokeColor: Colors.red,
      strokeWidth: 2,
    );

    return Scaffold(
      body: GoogleMap(
        polygons: na ? {manypolygon} : {manyNotPolygon},
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        markers: Set<Marker>.from(_manyMarker),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (position) async {
          setState(() {
            _points.add(LatLng(position.latitude, position.longitude));
            _addMarker(LatLng(position.latitude, position.longitude));
          });
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        button(
          Label: "Reset",
          function: () {
            setState(() {
              _manyMarker.clear();
              _points.clear();
            });
          },
          ZColors: ZColors.buttonColorred,
        ),
        button(
          Label: "All done",
          function: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  DialogQuestion: "Are you sure you are done",
                  DialogButtonLeftText: "Not Quite",
                  DialogButtonLeftFunction: () {
                    Navigator.pop(context);
                  },
                  DialogButtonRightText: "Yes I am",
                  DialogButtonRightFunction: () {
                    if (_points.isEmpty && _manyMarker.isEmpty){
                        showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return WarningDialog(DialogQuestion:"Invaild Entries Please Retry Again" );
                      },
                    );
                    }
                    else{
                      checkIntersection(_points);
                     // _db.AddMapCoordinates(_points);
                     // _db.updateCoordinates(_points);
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return LoadingDialog(screen: MessageSuccessScreen(), seconds: 2);
                    //   },
                    // );
                    } 
                  },
                );
              },
            );
          },
          ZColors: ZColors.buttonColorgreen,
        ),
      ],
    );
  }
}

Future<Position> getCurrentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}

