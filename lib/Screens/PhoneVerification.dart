import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/verificationOTP.dart';
import 'package:gold/Screens/VerificationSuccessScreen.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';
import 'CustomDialog.dart';

class PhoneVerification extends StatefulWidget {
  var mobileNumber;
  var accessToken;

  PhoneVerification({this.mobileNumber, this.accessToken});

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
    border: Border.all(color: Color(0xff00A9A5)),
  );

  VerificationOtp _verificationOTP;

  Future<VerificationOtp> verifyOTP(String verificationCode) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": "${widget.accessToken}",
      "action": "customer/verificationOtp",
      "mobileNumber": "${widget.mobileNumber}",
      "verificationCode": verificationCode,
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return verificationOtpFromJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("At Page Phone Verification ************${widget.accessToken}");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: padding, right: padding),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff2B2921),
                Color(0xffC1A035),
              ])),
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
                              onTap: () {
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
                            padding: EdgeInsets.only(left: padding * 2),
                            alignment: Alignment.centerLeft,
                            child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                            Text(
                              'Phone Verification',
                              style: CustomFonts.googleHeaderFont(
                                  color: Colors.white, fontSize: 20),
                            ):  Text(
                              'التحقق من الهاتف',
                              style: CustomFonts.googleHeaderFont(
                                  color: Colors.white, fontSize: 20),
                            )
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
                    child:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    Text(
                      'A verification code is sent to your number',
                      style: CustomFonts.googleBodyFont(
                          color: Colors.white.withOpacity(0.7), fontSize: 16),
                    ):
                    Text(
                      'يتم إرسال رمز التحقق إلى رقمك',
                      style: CustomFonts.googleBodyFont(
                          color: Colors.white.withOpacity(0.7), fontSize: 16),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: padding * 4),
                      height: height * 0.07,
                      child: RichText(
                        text: TextSpan(
                            text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                            'provided': 'قدمت',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 16),
                            children: [
                              TextSpan(
                                  text: '    ${widget.mobileNumber}',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18))
                            ]),
                      )),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      height: SizeConfig.isMobilePortrait
                          ? height * 0.15
                          : height * 0.35,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.isMobilePortrait
                              ? padding * 2
                              : padding * 20),
                      child: PinPut(
                        fieldsCount: 6,
                        textStyle: const TextStyle(
                            fontSize: 25.0, color: Color(0xff00A9A5)),
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
                    )),
                SizedBox(
                  height: height * 0.06,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    height: height * 0.15,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: padding * 2),
                    child: RaisedButton(
                      onPressed: () async {
                        final VerificationOtp verificationOtp =
                            await verifyOTP(_pinPutController.text);
                        setState(() {
                          _verificationOTP = verificationOtp;
                        });
                        if (_verificationOTP.status == 1) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: VerificationSuccess(
                                      accessToken: widget.accessToken)));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  message: _verificationOTP.message,
                                  icon: Icons.error_outline,
                                );
                              });
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(padding)),
                      color: Color(0xff00A9A5),
                      child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      Text(
                        'Verify Number',
                        style: CustomFonts.googleBodyFont(
                            color: Colors.white, fontSize: 20),
                      ): Text(
                        'تحقق من الرقم',
                        style: CustomFonts.googleBodyFont(
                            color: Colors.white, fontSize: 20),
                      ) ,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    height: height * 0.15,
                    alignment: Alignment.center,
                    child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    Text(
                      'Resend code',
                      style: CustomFonts.googleBodyFont(
                        color: Color(0xff00A9A5),
                      ),
                    ):  Text(
                      'أعد إرسال الرمز',
                      style: CustomFonts.googleBodyFont(
                        color: Color(0xff00A9A5),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: padding * 4),
                    child: RichText(
                      text: TextSpan(
                        text:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        'By topping Verify number above you agree to the': 'بتصدر رقم التحقق أعلاه ، فإنك توافق على',
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
                      padding: EdgeInsets.symmetric(horizontal: padding * 2),
                      child: RichText(
                        text: TextSpan(
                            text:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?''
                                ' Term of Service Privacy Policy' : 'سياسة خصوصية شروط الخدمة',
                            style:
                                CustomFonts.googleBodyFont(color: Colors.white),
                            children: [
                              TextSpan(
                                text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                ' or' : ' أو',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white.withOpacity(0.7)),
                              )
                            ]),
                      )),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    height: height * 0.05,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: padding * 2),
                    child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    Text(
                      'Cookies Policy',
                      style: CustomFonts.googleBodyFont(color: Colors.white),
                    ):
                    Text(
                      'اتفاقية ملفات تعريف الارتباط',
                      style: CustomFonts.googleBodyFont(color: Colors.white),
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
