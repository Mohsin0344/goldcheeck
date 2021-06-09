import 'package:flutter/material.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Screens/HomeScreen.dart';
import 'package:gold/Screens/NewSplashScreen.dart';
import 'package:gold/Screens/TestScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.init();
  String status=  App.localStorage.getString("accessToken");
  if(App.localStorage.getString('lang')== null){
    await App.init();
    await App.localStorage.setString("lang", "en");
  }
  print("Shared prefrence accessToken is----> $status");
  print("language is -----------------> ${App.localStorage.getString("lang")}");
  print("First Name is -----------------> ${App.localStorage.getString("firstName")}");
  print("Last Name is -----------------> ${App.localStorage.getString("lastName")}");
  runApp(MyApp(status: status,));
}

class MyApp extends StatefulWidget {
  var status;
  MyApp({
   this.status,
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
                home: widget.status==null? NewSplashScreen(): HomeScreen(
                  firstName: App.localStorage.getString("firstName"),
                  lastName: App.localStorage.getString("lastName"),
                  isVIP: App.localStorage.getInt("isVIP"),
                  walletCredit:
                  App.localStorage.getInt("walletCredit"),
                  accessToken: App.localStorage.getString('accessToken'),
                  email: App.localStorage.getString("email"),
                  phoneNumber: App.localStorage.getString("phoneNumber"),
                )
            );
            // return MaterialApp(home:GetAllProducts());
          },
        );
      },
    );
  }
}
