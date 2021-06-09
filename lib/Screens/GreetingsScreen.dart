import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';
import 'HomeScreen.dart';
import 'package:gold/Constants/ConstantColors.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          //physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: height * 0.60,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: padding * 8, vertical: padding * 4),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: ConstantColors.buttonColor),
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
                        App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        'Thank You for choosing us!': 'شكرا لك لاختيارنا!',
                        style: CustomFonts.googleBodyFont(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: padding * 2, left: padding * 2, right: padding),
              height: height * 0.12,
              child: Text(
                App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                'Booking Details' : 'تفاصيل الحجز',
                style: CustomFonts.googleBodyFont(
                  height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    0.0:1.0,
                    color: Colors.grey, fontSize: 20),
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
                  borderRadius: BorderRadius.circular(padding)),
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
                                  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                  'Time': 'زمن',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.grey),
                            )),
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
                                      '11:00am, 28 Jun 2019',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                    Text(
                                      '50 Minute From Now',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.buttonColor),
                                    ):
                                    Text(
                                      '50 دقيقة من الآن',
                                      style: CustomFonts.googleBodyFont(
                                        height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                          0.0:1.0,
                                          color: ConstantColors.buttonColor),
                                    ),
                                  ),
                                ),
                              ],
                            )),
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
                                  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                  'Service': 'الخدمات',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.grey),
                            )),
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
                                    App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                    'Haircut, Beard Plus' : 'قص الشعر ، بيرد بلس',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white),
                                  ),
                                ))
                              ],
                            )),
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
                                  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                  'Stylist': 'حلاق',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.grey),
                            )),
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
                                    App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                    'Caria' : 'كاريا',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white),
                                  ),
                                ))
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: padding * 3),
              child: Divider(
                indent: 2,
                endIndent: 2,
                color: Colors.grey,
              ),
            ),
            Container(
              height: height * 0.18,
              margin: EdgeInsets.only(
                  top: padding * 2, left: padding * 2, right: padding * 2),
              child: RaisedButton(
                child: Text(
                  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                  'Finish' : 'ينهي',
                  style: CustomFonts.googleBodyFont(
                      color: Colors.white, fontSize: 18),
                ),
                color: ConstantColors.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(padding),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen(
                    firstName: App.localStorage.getString("firstName"),
                    lastName: App.localStorage.getString("lastName"),
                    isVIP: App.localStorage.getInt("isVIP"),
                    walletCredit:
                    App.localStorage.getInt("walletCredit"),
                    accessToken: App.localStorage.getString('accessToken'),
                    email: App.localStorage.getString("email"),
                    phoneNumber: App.localStorage.getString("phoneNumber"),
                  )), (Route<dynamic> route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
