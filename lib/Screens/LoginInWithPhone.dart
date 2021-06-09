import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Screens/PhoneVerification.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Models/createUserWithMobile.dart';
import 'package:gold/Constants/Globals.dart';
import 'CustomDialog.dart';
import 'package:gold/Constants/ConstantColors.dart';

class LogInWitPhone extends StatefulWidget {
  @override
  _LogInWitPhoneState createState() => _LogInWitPhoneState();
}

class _LogInWitPhoneState extends State<LogInWitPhone> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;
  TextEditingController phoneNumber = TextEditingController();
  var pNumber;
  CreateUserWithMobile _createUserWithMobile;

  Future<CreateUserWithMobile> createUser(String mobileNumber) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "action": "customer/createUserWithMobile",
      "mobileNumber": "$mobileNumber",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return createUserWithMobileFromJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
           // padding: EdgeInsets.only(left: padding, right: padding),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff2B2921),
                      ConstantColors.backgroundColor,
                ])),
            child: Container(
              child: Column(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      color: ConstantColors.backgroundColor.withOpacity(0.5),
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
                                  color: ConstantColors.textColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              padding: EdgeInsets.only(left: padding * 4),
                              alignment: Alignment.centerLeft,
                              child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              Text(
                                'Enter your phone number',
                                style: CustomFonts.googleHeaderFont(
                                    color:ConstantColors.textColor, fontSize: SizeConfig.textMultiplier * 2.2),
                              ):   Text(
                                'أدخل رقم هاتفك',
                                style: CustomFonts.googleHeaderFont(
                                    color: ConstantColors.textColor, fontSize: SizeConfig.textMultiplier * 2.2),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 10,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: padding * 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                        color: Colors.white,
                      ),
                      height: height * 0.15,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top:padding,
                          left: padding,
                          right: padding,
                          bottom: padding
                        ),
                        child: IntlPhoneField(
                          controller: phoneNumber,
                          decoration: InputDecoration(
                              labelText: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Phone Number': 'رقم الهاتف',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: ConstantColors.buttonColor,
                                width: 1,
                              ))),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                            setState(() {
                              pNumber = phone.completeNumber;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.09,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: padding * 2),
                      height: height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          //color: Colors.green,
                          borderRadius: BorderRadius.circular(padding)),
                      child: RaisedButton(
                          color: ConstantColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(padding),
                          ),
                          child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                          Text(
                            'Send Verification Code',
                            style: CustomFonts.googleBodyFont(
                                color: ConstantColors.textColor, fontSize: SizeConfig.textMultiplier * 2.2),
                          ):
                          Text(
                            'أرسل رمز التحقق',
                            style: CustomFonts.googleBodyFont(
                                color: ConstantColors.textColor, fontSize: SizeConfig.textMultiplier * 2.2),
                          ),
                          onPressed: () async {
                            // print(" this is ---------- :$pNumber");
                            final CreateUserWithMobile createuserwithmobile =
                                await createUser(pNumber);
                            setState(() {
                              _createUserWithMobile = createuserwithmobile;
                            });
                            if (_createUserWithMobile.status == 1) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: PhoneVerification(
                                        mobileNumber: pNumber,
                                        accessToken: _createUserWithMobile
                                            .data.accessToken,
                                      )));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox(
                                      message: _createUserWithMobile.message,
                                      icon: Icons.error_outline,
                                    );
                                  });
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.10,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: padding * 3),
                      margin: EdgeInsets.symmetric(horizontal: padding * 2),
                      height: height * 0.07,
                      child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      Text(
                        'We will send a code to your',
                        style: CustomFonts.googleBodyFont(
                            color: ConstantColors.textColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 2.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ):   Text(
                        'سوف نرسل رمز إلى الخاص بك',
                        style: CustomFonts.googleBodyFont(
                            color: ConstantColors.textColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 2.2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.right,
                      )
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: padding * 3),
                        margin: EdgeInsets.symmetric(horizontal: padding * 2),
                        height: height * 0.07,
                        child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        Text(
                          'number. Standard data',
                          style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor.withOpacity(0.7),
                              fontSize: SizeConfig.textMultiplier * 2.2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ):   Text(
                          'رقم البيانات القياسية',
                          style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor.withOpacity(0.7),
                              fontSize: SizeConfig.textMultiplier * 2.2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.right,
                        )
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: padding * 3),
                        margin: EdgeInsets.symmetric(horizontal: padding * 2),
                        height: height * 0.07,
                        child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        Text(
                          'charges may apply',
                          style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor.withOpacity(0.7),
                              fontSize: SizeConfig.textMultiplier * 2.2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ):   Text(
                          'قد يتم تطبيق رسوم',
                          style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor.withOpacity(0.7),
                              fontSize: SizeConfig.textMultiplier * 2.2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.right,
                        )
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
