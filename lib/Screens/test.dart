import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gold/Constants/ConstantColors.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:map_launcher/map_launcher.dart';
class Testing extends StatefulWidget {
  var mypage;
  Testing({this.mypage});
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  Position _currentPosition;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<maps.PolylineId, maps.Polyline> polylines = {};
  List<maps.LatLng> polylineCoordinates = [];

  maps.GoogleMapController mapController;


  maps.CameraPosition _initialLocation = maps.CameraPosition(target: maps.LatLng(0.0, 0.0));

  Map<maps.PolylineId, maps.Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;

  void _add() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final maps.PolylineId polylineId = maps.PolylineId(polylineIdVal);

    final maps.Polyline polyline = maps.Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.blueAccent,
      width: 5,
      points: _createPoints(),
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
    currentPostionMarker();

  }
  List<maps.LatLng> _createPoints() {
    final List<maps.LatLng> points = <maps.LatLng>[];
    points.add(maps.LatLng(_currentPosition.latitude, _currentPosition.longitude));

    points.add(maps.LatLng(29.3387778, 48.0575556));
    return points;
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
          maps.CameraUpdate.newCameraPosition(
            maps.CameraPosition(
              target: maps.LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );

      });
    }).catchError((e) {
      print(e);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _getCurrentLocation();

    super.initState();
  }
  Map<maps.MarkerId, maps.Marker> markers = <maps.MarkerId, maps.Marker>{}; // CLASS MEMBER, MAP OF MARKS
  void currentPostionMarker() {
    var markerIdVal = "1";
    final maps.MarkerId markerId = maps.MarkerId(markerIdVal);

    // creating a new MARKER
    final maps.Marker marker = maps.Marker(
      markerId: markerId,
      position: maps.LatLng(
        29.3387778,
        48.0575556 ,
      ),
      infoWindow: maps.InfoWindow(title: markerIdVal, snippet: '*'),

    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> Future.sync(onWillPop),
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
        body: Container(
          width: SizeConfig.widthMultiplier*200,
          height: SizeConfig.heightMultiplier*100,
          child: Stack(
            children: [
              maps.GoogleMap(

                initialCameraPosition:  maps.CameraPosition(target: maps.LatLng(0, 0), zoom: 10.0),
                polylines: Set<maps.Polyline>.of(_mapPolylines.values),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: maps.MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                markers: Set<maps.Marker>.of(markers.values),
                onMapCreated: (maps.GoogleMapController controller) {

                  mapController = controller;
                },
                    gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))

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

                      // on button tap
                    },
                  ),
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.only(
              //       top: 80
              //   ),
              //   child: ClipOval(
              //     child: Material(
              //       color: ConstantColors.backgroundColor, // button color
              //       child: InkWell(
              //         splashColor: Colors.blue, // inkwell color
              //         child: SizedBox(
              //           width: 50,
              //           height: 50,
              //           child: Icon(Icons.add),
              //         ),
              //         onTap: (){
              //           mapController.animateCamera(
              //             CameraUpdate.zoomIn(),
              //
              //           );
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: 160
              //   ),
              //   child: ClipOval(
              //     child: Material(
              //       color: ConstantColors.backgroundColor, // button color
              //       child: InkWell(
              //         splashColor: Colors.blue, // inkwell color
              //         child: SizedBox(
              //           width: 50,
              //           height: 50,
              //           child: Icon(Icons.remove),
              //         ),
              //         onTap: () {
              //           mapController.animateCamera(
              //             CameraUpdate.zoomOut(),
              //           );
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                  top: 80
                ),
                child: InkWell(
                  onTap: (){
                    print('xxxxxxxxx');
                    openMapsSheet(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                      width: 60,
                    decoration: BoxDecoration(
                      color: ConstantColors.backgroundColor,
                      shape: BoxShape.circle
                    ),
                    child: Text(
                      'Navigation',
                      style: CustomFonts.googleBodyFont(
                        fontSize: SizeConfig.textMultiplier * 1.1,
                        fontWeight: FontWeight.bold
                      ),
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
                        width: 60,
                        height: 60,
                        child: Icon(Icons.location_on),
                      ),
                      onTap: () {
                      _add();
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  openMapsSheet(context) async {
    try {
      final title = "السحر الدمشقي";
      final description = "Salon";
      final coords = Coords(29.3387778, 48.0575556);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image.asset('images/google-maps.png'),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
  bool onWillPop() {
    widget.mypage.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    return false;
  }
}
