import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';

import 'HomeScreen.dart';


class GreetingsScreen extends StatefulWidget {
  @override
  _GreetingsScreenState createState() => _GreetingsScreenState();
}

class _GreetingsScreenState extends State<GreetingsScreen> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            //physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: height * 0.60,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5
                    )
                  )
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                    horizontal: padding * 8,
                  vertical: padding * 4
                ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff00A9A5)
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Text(
                          'Thank You for choosing us!',
                          style: CustomFonts.googleBodyFont(
                            color: Colors.white,
                            fontSize: 30
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: padding * 2,
                  left: padding * 2,
                  right: padding
                ),
                height: height * 0.12,
                child: Text(
                  'Booking Details',
                  style: CustomFonts.googleBodyFont(
                    color: Colors.grey,
                    fontSize: 20
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(padding),
                height: height * 0.50,
                margin: EdgeInsets.only(
                  left: padding * 2,
                  right: padding * 2,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff313444),
                  borderRadius: BorderRadius.circular(padding)
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Icon(
                                  Icons.access_time_rounded,
                                    color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  'Time',
                                  style: CustomFonts.googleBodyFont(
                                    color: Colors.grey
                                  ),
                                )
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft ,
                                          child: Text(
                                            '11:00am, 28 Jun 2019',
                                            style: CustomFonts.googleBodyFont(
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '50 Minute From Now',
                                            style: CustomFonts.googleBodyFont(
                                              color: Color(0xff00A9A5)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Icon(
                                  Icons.location_city_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  child: Text(
                                    'Service',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.grey
                                    ),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                            child: Text(
                                    'Haircut, Beard Plus',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white
                                    ),
                                  ),
                                        )
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Icon(
                                  Icons.account_box,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  child: Text(
                                    'Stylist',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.grey
                                    ),
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Caria',
                                              style: CustomFonts.googleBodyFont(
                                                  color: Colors.white
                                              ),
                                            ),
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: padding * 3
                ),
                child: Divider(
                  indent: 2,
                  endIndent: 2,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: height * 0.18,
                margin: EdgeInsets.only(
                  top:padding * 2,
                  left: padding * 2,
                  right: padding * 2
                ),
                child: RaisedButton(
                  child: Text(
                    'Finish',
                    style: CustomFonts.googleBodyFont(
                      color: Colors.white,
                      fontSize: 18
                    ),
                  ),
                  color: Color(0xff00A9A5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(padding),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: HomeScreen()));
                  },
                ),
              )
            ],
          ),
        ),
      );
  }
}
