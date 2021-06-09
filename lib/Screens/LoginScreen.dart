import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/LoginPresta.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';
import 'package:gold/Constants/ConstantColors.dart';

class LoginScreen extends StatefulWidget {
  var accessToken;
  var firstName;
  var lastName;

  LoginScreen({this.accessToken, this.firstName, this.lastName});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

  LoginPresta _loginPresta;

  Future<LoginPresta> loginProfile(String email, String password) async {
    print("i am In");
    final String url = "http://15.185.204.189/webapi/server.php";
    try{
      print("api hit");
      final response = await http.post(url, headers: {
        "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
      }, body: {
        "action": "customer/loginPresta",
        "email": "$email",
        "password": "$password",
        //"lang": App.localStorage.getString("lang"),
      });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final String responseString = response.body;
        print(responseString.toString());
        return LoginPresta.fromRawJson(responseString);
      } else {
        print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx${response.statusCode}');
      }

    }
    catch(e){
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("At Screen Login Screen****************** ${widget.accessToken}");
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
                    height: SizeConfig.heightMultiplier * 12,
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: SizeConfig.heightMultiplier * 20,
                      child: Image.asset('images/logob.png')),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 10,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 9,
                        right: SizeConfig.widthMultiplier * 9
                        ),
                    child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    Text(
                      'Login',
                      style: CustomFonts.googleBodyFont(
                          color: ConstantColors.textColor,
                          fontSize: SizeConfig.textMultiplier * 4,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.left,
                    ):   Text(
                      'تسجيل الدخول',
                      style: CustomFonts.googleBodyFont(
                          color: ConstantColors.textColor,
                          fontSize: SizeConfig.textMultiplier * 4,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?'Email':'البريد الإلكتروني', Icons.mail_outline_outlined, false, email),
                  textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?'Password':'كلمه السر', Icons.lock, true, password),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 8,
                      vertical: SizeConfig.heightMultiplier * 8,
                    ),
                    height: SizeConfig.heightMultiplier * 8,
                    child: RaisedButton(
                      onPressed: () async {
                        await App.init();
                        final LoginPresta loginPresta =
                            await loginProfile(email.text, password.text);
                        setState(() {
                          _loginPresta = loginPresta;
                        });
                        if (_loginPresta.status == 1) {
                          App.localStorage.setString("accessToken",
                              _loginPresta.data.accessToken);
                          App.localStorage.setString("firstName", _loginPresta.data.firstname);
                          App.localStorage.setString("lastName", _loginPresta.data.lastname);
                          App.localStorage.setInt("isVIP", _loginPresta.data.isVip);
                          App.localStorage.setInt("walletCredit", _loginPresta.data.walletCredit);
                          App.localStorage.setString("email", _loginPresta.data.email);
                          App.localStorage.setString("phoneNumber", _loginPresta.data.mobileNumber);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  message: _loginPresta.message,
                                  icon: Icons.check,
                                );
                              });
                          if(App.localStorage.getString('accessToken')!=null){
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: HomeScreen(
                                      firstName: App.localStorage.getString("firstName"),
                                      lastName: App.localStorage.getString("lastName"),
                                      isVIP: App.localStorage.getInt("isVIP"),
                                      walletCredit:
                                      App.localStorage.getInt("walletCredit"),
                                      accessToken: App.localStorage.getString('accessToken'),
                                      email: App.localStorage.getString("email"),
                                      phoneNumber: App.localStorage.getString("phoneNumber"),
                                    )));
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  message: _loginPresta.message,
                                  icon: Icons.error_outline,
                                );
                              });
                        }
                      },
                      color:ConstantColors.buttonColor,
                      child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      Text(
                        'Login',
                        style: CustomFonts.googleBodyFont(
                            color: ConstantColors.textColor, fontSize: 20),
                      ):
                      Text(
                        'تسجيل الدخول',
                        style: CustomFonts.googleBodyFont(
                            color: ConstantColors.textColor, fontSize: 20),
                      ) ,
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
    final node = FocusScope.of(context);
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
        onEditingComplete: () => node.nextFocus(),
        controller: controller,
        style: CustomFonts.googleBodyFont(
          color: Colors.black,
        ),
        cursorColor: ConstantColors.buttonColor,
        obscureText: val,
        decoration: InputDecoration(
            isDense: true,
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
              color: ConstantColors.buttonColor,
            ),
            hintText: '$labell',
            hintStyle: CustomFonts.googleBodyFont(color: ConstantColors.textColor)),
      ),
    );
  }
}
