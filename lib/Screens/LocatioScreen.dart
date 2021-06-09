
import 'dart:math';

import 'package:flutter/material.dart';


import 'package:gold/Constants/ConstantColors.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';

import 'package:flutter/material.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationScreen extends StatefulWidget {
  PageController myPage;
  LocationScreen({
   this.myPage
});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
// For controlling the view of the Map
  GoogleMapController mapController;
  final Geolocator _geolocator = Geolocator();

// For storing the current position
  Position _currentPosition;
  String _currentAddress;
  Set<Marker> markers = {};
  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates
    );
    polylines[id] = polyline;
    setState((){});
  }

  void makeLines() async {
    await polylinePoints
        .getRouteBetweenCoordinates(
      'AIzaSyAcl-Ogz3CI8rnp5diAE2ApxLAhj9yP-BU',
      PointLatLng(_currentPosition.latitude, _currentPosition.longitude), //Starting LATLANG
      PointLatLng(6.9271, 79.8612), //End LATLANG
      travelMode: TravelMode.driving,
    ).then((value) {
      value.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }).then((value) {
      addPolyLine();
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _createPolylines(_currentPosition);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
    child: Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ConstantColors.backgroundColor,
            title: Text(
              'Location',
              style: CustomFonts.googleHeaderFont(
                color: ConstantColors.textColor,
                fontSize: SizeConfig.textMultiplier * 2
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Container(
            height: height,
            width: width,
            child: Scaffold(
              body: Stack(
                children: <Widget>[
                  // TODO: Add Map View
                  GoogleMap(
                    polylines: Set<Polyline>.of(polylines.values),
                    initialCameraPosition: _initialLocation,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.orange[100], // button color
                      child: InkWell(
                        splashColor: Colors.orange, // inkwell color
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () async{
                          // TODO: Add the operation to be performed
                          _getCurrentLocation();
                          makeLines();
                          // on button tap
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 80
                    ),
                    child: ClipOval(
                      child: Material(
                        color: ConstantColors.backgroundColor, // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: (){
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),

                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 160
                    ),
                    child: ClipOval(
                      child: Material(
                        color: ConstantColors.backgroundColor, // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          // body: Builder(
          //   builder: (context) {
          //     return MaterialButton(
          //         onPressed: () => openMapsSheet(context),
          //         child: Container(
          //         decoration: BoxDecoration(
          //         image: DecorationImage(
          //     image: AssetImage('images/map.png',
          //     ),
          //             fit: BoxFit.cover
          //     )),
          //         )
          //     );
          //   },
          // ),
        )),
    );
  }

  _getCurrentLocation() async {
    await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() async{
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
        await _createPolylines(_currentPosition);
      });
    }).catchError((e) {
      print(e);
    });
  }

  _createPolylines(Position start) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
     'AIzaSyAcl-Ogz3CI8rnp5diAE2ApxLAhj9yP-BU', // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(29.3387778, 48.0575556),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
  }

  bool onWillPop() {
    widget.myPage.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    return false;
  }
}

///---------------------------------------------------------------------------------------
