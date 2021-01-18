import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Screens/VerificationSuccessScreen.dart';
import 'package:gold/SizeConfig.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';
import 'package:page_transition/page_transition.dart';

class PhoneVerification extends StatefulWidget {
  var phoneNumber = '+923449996419';
  PhoneVerification([this.phoneNumber]);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    //color: const Color.fromRGBO(43, 46, 66, 1),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: Color(0xff00A9A5)
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                left: padding,
                right: padding
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff2B2921),
                      Color(0xffC1A035),
                    ]
                )
            ),
            child: Container(
              child: Column(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      height: height * 0.15,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: padding * 2
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Phone Verification',
                                style: CustomFonts.googleHeaderFont(
                                    color: Colors.white,
                                    fontSize: 20
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      child: Text(
                        'A verification code is sent to your number',
                        style: CustomFonts.googleBodyFont(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: padding * 4
                      ),
                      height: height * 0.07,
                      child: RichText(
                        text: TextSpan(
                          text: 'provided',
                          style: CustomFonts.googleBodyFont(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 16
                          ),
                          children: [
                            TextSpan(
                              text: '    ${widget.phoneNumber}',
                              style: CustomFonts.googleBodyFont(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              )
                            )
                          ]
                        ),
                      )
                    ),
                  ),
                  SizedBox(height:SizeConfig.heightMultiplier * 5,),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      height: SizeConfig.isMobilePortrait ?height * 0.15 : height * 0.35,
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.isMobilePortrait ? padding * 2 : padding * 20
                      ),
                      child: PinPut(
                        fieldsCount: 6,
                        textStyle: const TextStyle(fontSize: 25.0, color: Color(0xff00A9A5)),
                        eachFieldWidth: 40.0,
                        eachFieldHeight: 55.0,
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: pinPutDecoration,
                        selectedFieldDecoration: pinPutDecoration,
                        followingFieldDecoration: pinPutDecoration,
                        pinAnimationType: PinAnimationType.fade,
                        fieldsAlignment: MainAxisAlignment.spaceAround,
                      ),
                    )
                  ),
                  SizedBox(height: height * 0.06,),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      height:
                      height * 0.15,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: padding * 2
                      ),
                      child: RaisedButton(
                          onPressed: (){
                            print('clicked');
                            Navigator.push(context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: VerificationSuccess()));
                          },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(padding)
                        ),
                        color: Color(0xff00A9A5),
                        child: Text(
                          'Verify Number',
                          style: CustomFonts.googleBodyFont(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: height * 0.15,
                      alignment: Alignment.center,
                      child: Text(
                        'Resend code',
                        style: CustomFonts.googleBodyFont(
                          color: Color(0xff00A9A5),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: padding * 4
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'By topping Verify number above you agree to the',
                          style: CustomFonts.googleBodyFont(
                            color: Color(0xff00A9A5),
                          ),
                          // children: [
                          //   TextSpan(
                          //     text: ' Term of Service Privacy Policy',
                          //     style: CustomFonts.googleBodyFont(
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          //   TextSpan(
                          //     text: ' and',
                          //     style: CustomFonts.googleBodyFont(
                          //       color: Colors.white.withOpacity(0.7),
                          //     ),
                          //   ),
                          // ]
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      height: height * 0.08,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: padding * 2
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: ' Term of Service Privacy Policy',
                          style: CustomFonts.googleBodyFont(
                            color: Colors.white
                          ),
                          children: [
                        TextSpan(
                        text: ' or',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.white.withOpacity(0.7)
                            ),
                        )
                          ]
                        ),
                      )
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      height: height * 0.05,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: padding * 2
                      ),
                      child: Text(
                        'Cookies Policy',
                        style: CustomFonts.googleBodyFont(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
