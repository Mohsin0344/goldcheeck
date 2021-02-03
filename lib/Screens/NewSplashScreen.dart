import 'package:flutter/material.dart';
import 'package:gold/Screens/SplashScreenn.dart';
import 'package:splashscreen/splashscreen.dart';

class NewSplashScreen extends StatefulWidget {
  @override
  _NewSplashScreenState createState() => _NewSplashScreenState();
}

class _NewSplashScreenState extends State<NewSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new SplashScreenn(),
      // title: new Text('السحر الدمشقي',
      //   style: new TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20.0
      //   ),),
      image: new Image.asset('images/logoy.png'),
      backgroundColor: Color(0xff272b33),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 150.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: Color(0xffddc654),
      // gradientBackground: LinearGradient(
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      //   colors: [
      //     Color(0xff272b33),
      //     Color(0xffddc654),
      //   ]
      // ),
    );
  }
}
