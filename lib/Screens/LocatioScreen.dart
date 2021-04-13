import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class LocationScreen extends StatelessWidget {
  PageController myPage;
  LocationScreen({
   this.myPage
});
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
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
    child: Material(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Builder(
            builder: (context) {
              return MaterialButton(
                  onPressed: () => openMapsSheet(context),
                  child: Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
              image: AssetImage('images/map.png',
              ),
                      fit: BoxFit.cover
              )),
                  )
              );
            },
          ),
        )),
    );
  }
  bool onWillPop() {
    myPage.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    return false;
  }
}
