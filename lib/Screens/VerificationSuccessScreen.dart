import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';
import 'ProfileInfoScreen.dart';
import 'package:gold/Constants/ConstantColors.dart';

class VerificationSuccess extends StatefulWidget {
  var accessToken;

  VerificationSuccess({this.accessToken});

  @override
  _VerificationSuccessState createState() => _VerificationSuccessState();
}

class _VerificationSuccessState extends State<VerificationSuccess> {
  var height = SizeConfig.heightMultiplier * 100;
  var width = SizeConfig.widthMultiplier * 200;
  var padding = CustomSizes.padding;

  @override
  Widget build(BuildContext context) {
    print("At page Verification Success**********${widget.accessToken}");
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xffF7F1DB),
                      ConstantColors.buttonColor,
                      ConstantColors.backgroundColor
                ])),
            child: ListView(
              padding: EdgeInsets.only(
                left: SizeConfig.imageSizeMultiplier * 8,
                right: SizeConfig.imageSizeMultiplier * 8,
              ),
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 50,
                  child: Image.asset('images/phone.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 4),
                  child: Text(
                    App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    'Your Phone Number is' : 'رقم هاتفك هو',
                    style: CustomFonts.googleBodyFont(
                        color: Colors.white,
                        fontSize: SizeConfig.textMultiplier * 3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
                  child: Text(
                    App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    'Verified!' : 'تم التحقق!',
                    style: CustomFonts.googleBodyFont(
                        color: ConstantColors.mainBackground,
                        fontSize: SizeConfig.textMultiplier * 3.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.heightMultiplier * 10),
                  height: SizeConfig.heightMultiplier * 8,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: ProfileInfo(
                                accessToken: widget.accessToken,
                              )));
                    },
                    color: ConstantColors.buttonColor,
                    child: Text(
                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      'Complete your Profile' : 'أكمل ملفك الشخصي',
                      style: CustomFonts.googleBodyFont(
                          color: Colors.white,
                          fontSize: SizeConfig.textMultiplier * 2,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
