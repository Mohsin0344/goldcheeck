
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Models/CompleteProfile.dart';
import 'package:gold/Models/LoginPresta.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:gold/Screens/HomeScreenView.dart';
import 'package:gold/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  var accessToken;
  LoginScreen({
    this.accessToken
  });
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
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers:
    {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    },
        body:
        {
          "action" : "customer/loginPresta",
          "email" :  "$email",
          "password" : "$password",
        });
    if(response.statusCode == 200){
      final String responseString = response.body;
      print(responseString.toString());
      return loginPrestaFromJson(responseString);
    }else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("At Screen Login Screen****************** ${widget.accessToken}");
    return  SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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
                    Color(0xffC1A035),
                    Color(0xff2B2921),
                  ]
              )
          ),
          child: Container(
              margin: EdgeInsets.only(
                  top: padding * 0
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 12,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: SizeConfig.heightMultiplier * 20,
                    child: Image.asset('images/logob.png')
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.widthMultiplier * 9
                    ),
                    child: Text(
                      'Login',
                      style: CustomFonts.googleBodyFont(
                          color: Colors.white,
                          fontSize: SizeConfig.textMultiplier * 4,
                          fontWeight: FontWeight.w800
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  textField('Email', Icons.mail_outline_outlined,  false, email),
                  textField('Password', Icons.lock, true, password),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 8,
                      vertical: SizeConfig.heightMultiplier * 8,
                    ),
                    height: SizeConfig.heightMultiplier * 8,
                    child: RaisedButton(
                      onPressed: () async{
                        final LoginPresta loginPresta = await loginProfile(
                            email.text,password.text
                        );
                        setState(() {
                          _loginPresta = loginPresta;
                        });
                        if (_loginPresta.status == 1) {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(message: _loginPresta.message,icon: Icons.check,);
                              }
                          );
                          Navigator.push(context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: HomeScreen(
                                    fullName: _loginPresta.data.fullName,
                                    isVIP: _loginPresta.data.isVip,
                                    walletCredit: _loginPresta.data.walletCredit,
                                    accessToken: _loginPresta.data.accessToken,
                                  )));
                        }else {
                          showDialog(context: context,
                              builder: (BuildContext context){
                                return CustomDialogBox(message: _loginPresta.message,icon: Icons.error_outline,);
                              }
                          );
                        }
                      },
                      color: Color(0xff00A9A5),
                      child: Text(
                        'Login',
                        style: CustomFonts.googleBodyFont(
                            color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(padding)
                      ),
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
  Widget textField(String labell, var icon, bool val, TextEditingController controller){
    return Container(
      margin: EdgeInsets.only(
          left: padding * 4,
          right: padding * 4,
          top: padding
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
        cursorColor: Color(0xff00A9A5),
        obscureText: val,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(padding * 0.5),
              borderSide: BorderSide(
                  color: Color(0xff00A9A5),
                  width: 1
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(padding * 0.5),
              borderSide: BorderSide(
                  color: Color(0xff00A9A5),
                  width: 2
              ),
            ),
            suffixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: '$labell',
            hintStyle: CustomFonts.googleBodyFont(
                color: Color(0xff00A9A5)
            )
        ),
      ),
    );
  }
}

