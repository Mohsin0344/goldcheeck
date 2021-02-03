import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_launcher/map_launcher.dart';

class LocationScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: Color(0xff272b33),
      body: Builder(
        builder: (context) {
          return MaterialButton(
              onPressed: () => openMapsSheet(context),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/map.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     margin:
                  //         EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                  //     child: Text(
                  //       'Click on Maps to Get Direction',
                  //       style: CustomFonts.googleBodyFont(
                  //           color: Color(0xff00A9A5),
                  //           fontSize: SizeConfig.textMultiplier * 3,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // )
                ],
              ));
        },
      ),
    ));
  }
}
