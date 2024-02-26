import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zlandsfrontend/common_widgets/common_widgets.dart';
import 'package:zlandsfrontend/db/db_helper.dart';
import 'package:zlandsfrontend/pages/maindashboard.dart';

class MoreInfoScreen extends StatelessWidget {
  final String tappedEmail;
  MoreInfoScreen({Key? key, required this.tappedEmail});

  @override
  Widget build(BuildContext context) {
    DB_help DB = DB_help();
    List<LatLng> _points = [];
    GoogleMapController? _googleMapController;
    List<Marker> _manyMarker = [];

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 10,
    );

  


    var media = MediaQuery.of(context).size;

    return FutureBuilder<Map<String, dynamic>?>(
      future: DB.getUserData(tappedEmail),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          Map<String, dynamic> userData = snapshot.data!;
          String nameOfTheUser = userData['Fullname'] ?? '';
          String area = userData['Area'] ?? '';
          var mobile = userData['Mobile Phone Number'] ?? '';

          final coordinatesString = userData['Coordinates'] as String?;
          if (coordinatesString != null) {
            final regex = RegExp(r'LatLng\(([^,]+),\s([^)]+)\)');
            final matches = regex.allMatches(coordinatesString);
            _points = matches
                .map((match) => LatLng(
                      double.parse(match.group(1)!),
                      double.parse(match.group(2)!),
                    ))
                .toList();


            _manyMarker = _points
                .asMap()
                .entries
                .map((entry) => Marker(
                      markerId: MarkerId('Marker ${entry.key}'),
                      position: entry.value,
                      infoWindow: InfoWindow(
                        title: 'GOOGLE PLEX ${entry.key}',
                        snippet:
                            'Latitude is ${entry.value.latitude}, longitude is ${entry.value.longitude}',
                      ),
                      draggable: false,
                    ))
                .toList();

            try {
              if (_googleMapController != null && _points.isNotEmpty) {
                _googleMapController!.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _points.first,
                      zoom: 18,
                    ),
                  ),
                );
              }
            } catch (e) {
              print('Error moving camera: $e');
            }
          }
            Polygon manynotpolygon = Polygon(
  polygonId: PolygonId('manynotpolygon'), // Unique ID for the polygon
  points: [LatLng(37.4219985, -122.0839999)],
  fillColor: Colors.transparent, // Use transparent fill color
  strokeColor: Colors.red, // Adjust stroke color as needed
  strokeWidth: 2,
);

Polygon manypolygon = Polygon(
  polygonId: PolygonId('manypolygon'), // Unique ID for the polygon
  points: _points,
  fillColor: Colors.red.withOpacity(0.2), // Adjust fill color with transparency
  strokeColor: Colors.red, 
  strokeWidth: 2,
  geodesic: true,
  zIndex: 1,
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
                        MaterialPageRoute(
                          builder: (context) => MainDashboard(),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    hoverColor: Colors.white.withOpacity(0.15),
                  ),
                  SizedBox(width: 20),
                  textArea(
                    Label: 'More Info',
                    FontFamily: 'Karla Light',
                    Fontweight: FontWeight.w700,
                    fontSize: 36,
                  ),
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
                  child: Container(
                    width: media.width * 0.9,
                    height: media.height * 0.4,
                    child: GoogleMap(
                     polygons: {
                        _points.isNotEmpty ? manypolygon : manynotpolygon
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
                    ),
                  ),
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
                  child: textArea(
                    Label: nameOfTheUser,
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
                            Label: "Area:",
                            FontFamily: 'Karla Light',
                            Fontweight: FontWeight.w700,
                            fontSize: 22,
                          ),
                          SizedBox(width: 28),
                          textArea(
                            Label: area,
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
                            Label: "Full-Name:",
                            FontFamily: 'Karla Light',
                            Fontweight: FontWeight.w700,
                            fontSize: 22,
                          ),
                          SizedBox(width: 28),
                          textArea(
                            Label: nameOfTheUser,
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
                            Label: "Mobile Phone:",
                            FontFamily: 'Karla Light',
                            Fontweight: FontWeight.w700,
                            fontSize: 22,
                          ),
                          SizedBox(width: 28),
                          textArea(
                            Label: mobile.toString(),
                            FontFamily: 'Karla Light',
                            Fontweight: FontWeight.w700,
                            fontSize: 22,
                          ),
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
