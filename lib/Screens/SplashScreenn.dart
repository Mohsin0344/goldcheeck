import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Screens/HomeScreenView.dart';
import 'package:gold/Screens/LoginInWithPhone.dart';
import 'package:gold/Screens/LoginScreen.dart';
import 'package:gold/Screens/ProfileInfoScreen.dart';
import 'package:page_transition/page_transition.dart';

import 'HomeScreen.dart';

class SplashScreenn extends StatefulWidget {
  @override
  _SplashScreennState createState() => _SplashScreennState();
}

class _SplashScreennState extends State<SplashScreenn> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: padding, right: padding),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff272b33),
                Color(0xffddc654),
              ])),
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.heightMultiplier * 2,

            ),
            child: Column(
              children: [
                Expanded(
                  flex: SizeConfig.isMobilePortrait ? 6 : 9,
                  child: Container(
                      width: width,
                      //color: Colors.red,
                      alignment: Alignment.center,
                      child: Image.asset('images/logoy.png')),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: padding * 4),
                    //color: Colors.black,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enhance your experience with',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    // color: Colors.red,
                    margin: EdgeInsets.only(left: padding * 4),
                    alignment: Alignment.topLeft,
                    // padding: EdgeInsets.only(
                    //   right: padding * 8
                    // ),
                    child: Text(
                      'Ms damascus salon!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                      margin: EdgeInsets.only(left: padding * 5),
                      child: SizeConfig.isMobilePortrait
                          ? Column(
                              children: [
                                listTile('Booking System'),
                                listTile('Loyalty Points & Coupons'),
                                listTile('View your History of your Haircut'),
                                listTile('Product Shopping'),
                                listTile('Get Direction'),
                              ],
                            )
                          : Row(
                              children: [
                                listTile('Booking System'),
                                listTile('Loyalty Points & Coupons'),
                                listTile('View your History of your Haircut'),
                                listTile('Product Shopping'),
                                listTile('Get Direction'),
                              ],
                            )),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign up or Log in with:',
                      style: CustomFonts.googleBodyFont(
                          color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                ),
                Expanded(
                  flex: SizeConfig.isMobilePortrait ? 3 : 6,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: LoginScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                        color: Color(0xff1281E3),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: padding * 5, vertical: padding),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Icon(
                                Icons.login,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: padding * 8),
                              child: Text(
                                'login',
                                style: CustomFonts.googleBodyFont(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: SizeConfig.isMobilePortrait ? 3 : 6,
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                        color: Color(0xff00A9A5),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: padding * 5, vertical: padding),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: padding * 8),
                              child: Text(
                                'Phone Number',
                                style: CustomFonts.googleBodyFont(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: LogInWitPhone()));
                    },
                  ),
                ),
                // Expanded(
                //   flex: 2,
                //   child: InkWell(
                //     onTap: (){
                //       Navigator.push(context,
                //           PageTransition(
                //               type: PageTransitionType.rightToLeft,
                //               child: HomeScreen()));
                //     },
                //     child: Container(
                //       margin: EdgeInsets.symmetric(
                //           horizontal: SizeConfig.isMobilePortrait ?
                //           padding * 5
                //               :
                //               padding * 30
                //       ),
                //       child: Row(
                //         children: [
                //           Expanded(
                //             flex: 3,
                //             child: Container(
                //               alignment: Alignment.centerRight,
                //               child: Text(
                //                 'Continue without Sign in',
                //                 style: CustomFonts.googleBodyFont(
                //                     color: Colors.white.withOpacity(0.7)
                //                 ),
                //               ),
                //             ),
                //           ),
                //           Expanded(
                //             child: Container(
                //               padding: EdgeInsets.only(
                //                   left: padding
                //               ),
                //               alignment: Alignment.centerLeft,
                //               child: Icon(
                //                 Icons.arrow_forward,
                //                 color: Colors.black.withOpacity(0.3),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listTile(String textt) {
    return Expanded(
      child: Container(
          child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1)),
            ),
          ),
          Expanded(
            flex: SizeConfig.isMobilePortrait ? 30 : 30,
            child: Container(
              padding: EdgeInsets.only(left: padding * 1.5),
              child: Text(
                '$textt',
                style: CustomFonts.googleBodyFont(
                    color: Colors.white.withOpacity(0.7)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
