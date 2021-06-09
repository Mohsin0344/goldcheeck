import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/CompleteProfile.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/ConstantColors.dart';

class ProfileInfo extends StatefulWidget {
  var accessToken;

  ProfileInfo({this.accessToken});

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;
  CompleteProfile _completeProfile;

  Future<CompleteProfile> createProfile(
      String firstName, String lastName, String email, String password) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": "${widget.accessToken}",
      "action": "customer/completeCustomerProfile",
      "firstName": "$firstName",
      "lastName": "$lastName",
      "email": "$email",
      "password": "$password",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return completeProfileFromJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("At Sign up Screen ******************* ${widget.accessToken}");
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: padding, right: padding),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ConstantColors.backgroundColor,
                Color(0xff2B2921),
              ])),
          child: Container(
              margin: EdgeInsets.only(top: padding * 0),
              child: ListView(
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: SizeConfig.heightMultiplier * 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/logob.png'),
                    )),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 9),
                    child: Text(
                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      'Sign Up' : 'اشتراك',
                      style: CustomFonts.googleBodyFont(
                          color: ConstantColors.textColor,
                          fontSize: SizeConfig.textMultiplier * 4,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  textField(
                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      'First Name': 'الاسم الأول', Icons.supervisor_account, false, firstName),
                  textField(
                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      'Last Name': 'الكنية', Icons.supervisor_account, false, lastName),
                  textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                  'Email': 'البريد الإلكتروني', Icons.mail_outline_outlined, false, email),
                  textField('Password', Icons.lock, true, password),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Container(
                    height: SizeConfig.heightMultiplier * 3,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 9),
                    child: Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                'Already a member?' : 'عضوا فعلا؟',
                                style: CustomFonts.googleBodyFont(
                                    color: ConstantColors.textColor,
                                    fontSize: SizeConfig.textMultiplier * 2.5),
                                children: [
                                  TextSpan(
                                      text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      '  Login' : 'تسجيل الدخول  ',
                                      style: CustomFonts.googleBodyFont(
                                        color: ConstantColors.textColor,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print('clickedddddddddd');
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .rightToLeft,
                                                  child: LoginScreen(
                                                    accessToken:
                                                        widget.accessToken,
                                                  )));
                                        }),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 8,
                      vertical: SizeConfig.heightMultiplier * 6,
                    ),
                    height: SizeConfig.heightMultiplier * 8,
                    child: RaisedButton(
                      onPressed: () async {
                        final CompleteProfile completeProfile =
                            await createProfile(firstName.text, lastName.text,
                                email.text, password.text);
                        setState(() {
                          _completeProfile = completeProfile;
                        });
                        if (_completeProfile.status == 1) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  message: _completeProfile.message,
                                  icon: Icons.error_outline,
                                );
                              });
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: LoginScreen(
                                    accessToken: widget.accessToken,
                                  )));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  message: _completeProfile.message,
                                  icon: Icons.error_outline,
                                );
                              });
                        }
                      },
                      color: ConstantColors.buttonColor,
                      child: Text(
                        App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        'Finish': 'ينهي',
                        style: CustomFonts.googleBodyFont(
                            color: ConstantColors.textColor, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(padding)),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget textField(
      String labell, var icon, bool val, TextEditingController controller) {
    return Container(
      margin:
          EdgeInsets.only(left: padding * 4, right: padding * 4, top: padding
              //vertical: padding
              ),
      padding: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 0.5,
      ),
      height: height * 0.15,
      child: TextField(
        controller: controller,
        style: CustomFonts.googleBodyFont(
          color: Colors.black,
        ),
        cursorColor: ConstantColors.buttonColor,
        obscureText: val,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(padding * 0.5),
              borderSide: BorderSide(color: ConstantColors.buttonColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(padding * 0.5),
              borderSide: BorderSide(color: ConstantColors.buttonColor, width: 2),
            ),
            suffixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: '$labell',
            hintStyle: CustomFonts.googleBodyFont(color: ConstantColors.buttonColor)),
      ),
    );
  }
}
