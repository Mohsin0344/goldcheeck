import 'package:flutter/material.dart';
import 'package:gold/Screens/CalendarScreen.dart';
import 'package:gold/Screens/HomeScreen.dart';
import 'package:gold/Screens/LocatioScreen.dart';
import 'package:gold/Screens/LoginScreen.dart';
import 'package:gold/Screens/PhoneVerification.dart';
import 'package:gold/Screens/ProductsScreen.dart';
import 'package:gold/Screens/ProfileInfoScreen.dart';
import 'package:gold/Screens/SplashScreen.dart';
import 'package:gold/SizeConfig.dart';
import 'package:gold/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: Colors.yellow,
              ),
              debugShowCheckedModeBanner: false,
              title: 'السحر الدمشقي',
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}