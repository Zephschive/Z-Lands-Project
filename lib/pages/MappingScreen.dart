import 'package:flutter/material.dart';
import 'package:zlandsfrontend/common_widgets/LoadingDialog.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';

import 'package:zlandsfrontend/pages/MessageSuccesScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';



class MappingLand extends StatefulWidget {
  MappingLand({super.key});

  @override
  State<MappingLand> createState() => _MappingLandState();
}

class _MappingLandState extends State<MappingLand> {
      



  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
       




    return Scaffold(
      body:ListView(
        
        children: [
          SizedBox(height: 40,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            textArea(Label: "Mapping Land", FontFamily: 'Karla', Fontweight: FontWeight.w700, fontSize: 36)
          ],),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textArea(Label: "  Walk around your land ,  ", 
                    FontFamily: 'Karla Light', 
                    Fontweight: FontWeight.w400, 
                    fontSize: 25)
                  ],
                ),
                Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "make sure you hit the", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: "plus button after every ", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textArea(Label: " corner", 
              FontFamily: 'Karla Light', 
              Fontweight: FontWeight.w400, 
              fontSize: 25)
            ],
          )
              ],
            ),
          ),
          SizedBox(height: 50),
          Padding(
          padding: EdgeInsets.fromLTRB(media.width*0.2, 0,media.width*0.2, 0),
            child: button(Label: "Go To Map", function: (){
              Navigator.pushReplacement(
           context,
           MaterialPageRoute(
           builder: (context) => MapSample12()));
            }, ZColors: ZColors.buttonColorblue),
          ),
        
          
        SizedBox(height: 30,),
     
     SizedBox(height: 40,),
      

        ],
      ) ,
      backgroundColor: ZColors.screencolor,
    );
  }
}




class MapSample12 extends StatefulWidget {
  MapSample12({super.key});

  @override
  State<MapSample12> createState() => MapSampleState12();
}

class MapSampleState12 extends State<MapSample12> {
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

 DB_help DB = DB_help();

  void _addmarker (LatLng markerpoints) {
 setState(() {

              
              _manyMarker.add(Marker(markerId: MarkerId('Marker ${_manyMarker.length}'),
        position:  LatLng(markerpoints.latitude,markerpoints.longitude),
        infoWindow: InfoWindow(title: 'GOOGLE PLEX ${_manyMarker.length}',snippet: 'Latitude is ${markerpoints.latitude}, longitude iS ${markerpoints.longitude} '),
        draggable: true
              ));
 });

  }

  Future<Position> getCurrentPosition() async{


 bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();



 }
Future<void> _goCurrentPosition(double statLat,double statlng) async{

  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
    zoom: 15,
    target: LatLng(statLat,statlng))));
  _addmarker(LatLng( statLat, statlng));
}

Future<LatLng> _goCurrentPosition1() async {
   Position currentPosition = await getCurrentPosition();
    try {
      Position currentPosition = await getCurrentPosition();
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 15,
            target: LatLng(currentPosition.latitude, currentPosition.longitude),
          ),
        ),
      );
      _addmarker(LatLng(currentPosition.latitude, currentPosition.longitude));
     // _points.add(LatLng(currentPosition.latitude, currentPosition.longitude));
    } catch (e) {
      print('Error getting current position: $e');
    }
    
    return  LatLng(currentPosition.latitude, currentPosition.longitude);
}

 @override
  void initState() {
    super.initState();
  _goCurrentPosition1();
  _getCurrentLocation();
   
  }
   
  void _getCurrentLocation() async {
  try {
    Position currentPosition = await getCurrentPosition();
    setState(() {
      _goCurrentPosition(currentPosition.latitude, currentPosition.longitude);
      _points.add(LatLng(currentPosition.latitude, currentPosition.longitude));
    });
  } catch (e) {
    print('Error getting current location: $e');
  }
}
  @override
  Widget build(BuildContext context) {
  print(_points);
bool na;
  if(_points.isNotEmpty)
  {
    na = true;
  }else{
    na= false;
  }

   
  Polygon manypolygon = Polygon(polygonId: PolygonId('Polygon ${_points.length}'),
  points:_points,
  fillColor: Colors.red.shade100,
  strokeColor: Colors.red,
  strokeWidth: 2,
  geodesic: true,
  zIndex: 1
  );


  Polygon manynotpolygon = Polygon(polygonId: PolygonId('Polygon ${_points.length}'),
  points:[LatLng(37.4219985, -122.0839999)],
  fillColor: Colors.transparent,
  strokeColor: Colors.red,
  strokeWidth: 2,
  );
    return Scaffold(
      body: GoogleMap(
     polygons: na ?{manypolygon} :{manynotpolygon} ,
       
        zoomControlsEnabled: false,
        mapToolbarEnabled: false,
        markers: Set<Marker>.from(_manyMarker),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
          
        },
        onTap: (position) async{
          setState(() {

            _points.add(LatLng(position.latitude, position.longitude));
              _manyMarker.add(Marker(markerId: MarkerId('Marker ${_manyMarker.length}'),
        position:  LatLng(position.latitude,position.longitude),
        infoWindow: InfoWindow(title: 'GOOGLE PLEX ${_manyMarker.length}',snippet: 'Latitude is ${position.latitude}, longitude iS ${position.longitude} '),
        draggable: true
              ));
       

          });
          
        },
      ),persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons:
       [
         button(Label: "Reset", function: (){

          setState(() {
             _manyMarker.clear();
          _points.clear();
          });
         

          print(_points);
         }, ZColors: ZColors.buttonColorred),
         
        button(Label: "All done", function: (){
             
           showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(DialogQuestion: "Are you sure you are done" , DialogButtonLeftText: "Not Quite", DialogButtonLeftFunction:(){}, DialogButtonRightText: "Yes I am ", DialogButtonRightFunction: (){
                    DB.AddMapCoordinates(_points); 
                    showDialog(context: context, builder:(BuildContext context) {
                      return LoadingDialog(screen: MessageSuccessScreen(), seconds: 2);}
                      
                     );


                  }); 
                },
              );
        }, ZColors: ZColors.buttonColorgreen)
      ],
     
    );
  }

 
}


