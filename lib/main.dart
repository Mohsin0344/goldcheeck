import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Screens/HomeScreen.dart';
import 'package:gold/Screens/LoginScreen.dart';
import 'package:gold/Screens/NewSplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.init();
  String status=  App.localStorage.getString("accessToken");
  print("Shared prefrence accessToken is----> $status");
  runApp(MyApp(
    status: status,
  ));
}

class MyApp extends StatefulWidget {
  var status;
  var firstName;
  var lastName;
  MyApp({
   this.status,
    this.firstName,
    this.lastName
});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context)  {
    print("At main Build ${widget.status}");
   // print(widget.firstName + widget.lastName);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'السحر الدمشقي',
                home: widget.status==null? NewSplashScreen(): LoginScreen()
            );
          },
        );
      },
    );
  }
}
