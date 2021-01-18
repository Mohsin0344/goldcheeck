import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Screens/PhoneVerification.dart';
import 'package:gold/SizeConfig.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';

class LogInWitPhone extends StatefulWidget {
  @override
  _LogInWitPhoneState createState() => _LogInWitPhoneState();
}

class _LogInWitPhoneState extends State<LogInWitPhone> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

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
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: padding
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
                                  'Enter your phone number',
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
                     height: SizeConfig.heightMultiplier*10,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: padding * 2
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(padding),
                          color: Colors.white,
                        ),
                        height: height * 0.15,
                        child: Padding(
                          padding: EdgeInsets.all(
                              padding
                          ),
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff00A9A5),
                                      width: 1,
                                    )
                                )
                            ),
                            onChanged: (phone) {
                              print(phone.completeNumber);
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
                        padding: EdgeInsets.symmetric(
                            horizontal: padding * 2
                        ),
                        height: height * 0.15,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //color: Colors.green,
                            borderRadius: BorderRadius.circular(padding)
                        ),
                        child: RaisedButton(
                          color: Color(0xff00A9A5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(padding),
                          ),
                          child: Text(
                            'Send Verification Code',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                          onPressed: (){
                            Navigator.push(context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: PhoneVerification()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.10,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding * 3
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: padding * 2
                        ),
                        height: height * 0.25,
                        child: Text(
                          'We will send a code to your number. Standard data '
                              'charges may apply.',
                          style: CustomFonts.googleBodyFont(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
