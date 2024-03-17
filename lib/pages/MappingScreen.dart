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
  bool intersectionDetected = false;
  

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
            zoom: 19,

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
          print(doc['Coordinates'].toString());
          

        // Check for intersection with each position of the other user
        otherUserPositions.forEach((otherPosition) {
          // Compare each user's position with the new position
          userPositions.forEach((userPosition) {
            if (!intersectionDetected && polygonsIntersect(userPositions, otherUserPositions)) {
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
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Reset'),
                        onPressed: () {
                           setState(() {
                        
              _manyMarker.clear();
              _points.clear();
                  Navigator.of(context).pop();
              Navigator.of(context).pop();
            });
                        },
                      )
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



bool isIntersecting(List<LatLng> positions1,List<LatLng> positions2) {
  // Check if the number of positions is the same in both lists
  if (positions1.length != positions2.length) {
    print('Lists have different lengths');
    return false;
  }

  // Round latitude and longitude values to a certain number of decimal places
  List<String> roundedPositions1 = positions1.map((position) => '${position.latitude.toStringAsPrecision(2)},${position.longitude.toStringAsPrecision(2)}').toList();

  List<String> roundedPositions2 = positions2.map((position) => '${position.latitude.toStringAsPrecision(2)},${position.longitude.toStringAsPrecision(2)}').toList();

  // Sort the rounded positions in both lists to ensure they are in the same order
  roundedPositions1.sort();
  roundedPositions2.sort();

  print(roundedPositions1.toString());
  print(roundedPositions2.toString());

  // Check if each rounded position in positions1 is equal to the corresponding rounded position in positions2
  for (int i = 0; i < roundedPositions1.length; i++) {
    if (roundedPositions1[i] != roundedPositions2[i]) {
      print('Positions are different');
      return false;
    }
  }

  // If all positions are equal, return true
  print('Positions are exactly the same');
  return true;
}


// Function to determine if two polygons intersect using Ray Casting algorithm
bool polygonsIntersect(List<LatLng> positions1,List<LatLng> positions2) {
  // Extract points from the polygons
  List<LatLng> points1 = positions1;
  List<LatLng> points2 = positions2;

  // Iterate through each edge of polygon1
  for (int i = 0; i < points1.length; i++) {
    LatLng p1 = points1[i];
    LatLng p2 = points1[(i + 1) % points1.length];

    // Iterate through each edge of polygon2
    for (int j = 0; j < points2.length; j++) {
      LatLng q1 = points2[j];
      LatLng q2 = points2[(j + 1) % points2.length];

      // Check if edges intersect using Ray Casting algorithm
      if (_doSegmentsIntersect(p1, p2, q1, q2)) {
        return true; // Intersection detected
      }
    }
  }
  return false; // No intersection detected
}

// Function to check if two line segments intersect using Ray Casting algorithm
bool _doSegmentsIntersect(LatLng p1, LatLng p2, LatLng q1, LatLng q2) {
  // Determine orientations
  int o1 = _orientation(p1, p2, q1);
  int o2 = _orientation(p1, p2, q2);
  int o3 = _orientation(q1, q2, p1);
  int o4 = _orientation(q1, q2, p2);

  // General case for intersection
  if (o1 != o2 && o3 != o4) {
    return true;
  }

  // Special cases to handle collinear points
  if (o1 == 0 && _onSegment(p1, q1, p2)) return true;
  if (o2 == 0 && _onSegment(p1, q2, p2)) return true;
  if (o3 == 0 && _onSegment(q1, p1, q2)) return true;
  if (o4 == 0 && _onSegment(q1, p2, q2)) return true;

  return false; // No intersection
}

// Function to determine orientation of ordered triplet of points
int _orientation(LatLng p, LatLng q, LatLng r) {
  double val = (q.longitude - p.longitude) * (r.latitude - q.latitude) -
      (q.latitude - p.latitude) * (r.longitude - q.longitude);
  if (val == 0) return 0; // Collinear
  return (val > 0) ? 1 : 2; // Clockwise or counterclockwise
}

// Function to check if point q lies on segment p-r
bool _onSegment(LatLng p, LatLng q, LatLng r) {
  if (q.latitude <= max(p.latitude, r.latitude) &&
      q.latitude >= min(p.latitude, r.latitude) &&
      q.longitude <= max(p.longitude, r.longitude) &&
      q.longitude >= min(p.longitude, r.longitude)) {
    return true;
  }
  return false;
}








  @override
  Widget build(BuildContext context) {
    bool na = _points.isNotEmpty;
    var media = MediaQuery.of(context).size;
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
        minMaxZoomPreference: MinMaxZoomPreference(19, 19),
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
                    //  print(_points);
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

