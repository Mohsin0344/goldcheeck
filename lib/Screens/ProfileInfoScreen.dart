

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Models/CompleteProfile.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:gold/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';
import 'LoginScreen.dart';

class ProfileInfo extends StatefulWidget {
  var accessToken;
  ProfileInfo({
   this.accessToken
});
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
  Future<CompleteProfile> createProfile(String firstName, String lastName, String email, String password) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers:
    {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    },
        body:
        {
          "accessToken" : "${widget.accessToken}",
          "action" : "customer/completeCustomerProfile",
          "firstName" : "$firstName",
          "lastName" : "$lastName",
          "email" :  "$email",
          "password" : "$password",
        });
    if(response.statusCode == 200){
      final String responseString = response.body;
      print(responseString.toString());
      return completeProfileFromJson(responseString);
    }else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("At Sign up Screen ******************* ${widget.accessToken}");
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
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: SizeConfig.heightMultiplier * 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logob.png'),
                    )
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier * 9
                  ),
                  child: Text(
                    'Sign Up',
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
                textField('First Name', Icons.supervisor_account, false, firstName),
                textField('Last Name', Icons.supervisor_account,  false, lastName),
                textField('Email', Icons.mail_outline_outlined,  false, email),
                textField('Password', Icons.lock, true, password),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
              Container(
                height: SizeConfig.heightMultiplier * 3,
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 9
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already a member?',
                          style: CustomFonts.googleBodyFont(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 2.5
                          ),
                          children: [
                            TextSpan(
                              text: '  Login',
                              style: CustomFonts.googleBodyFont(
                                color: Color(0xff00A9A5),
                              ),
                           recognizer: TapGestureRecognizer()
                           ..onTap = () {
                                print('clickedddddddddd');
                             Navigator.push(context,
                                 PageTransition(
                                     type: PageTransitionType.rightToLeft,
                                     child: LoginScreen(
                                       accessToken: widget.accessToken,
                                     )));
                      }),
                          ]
                        ),
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
                  onPressed: () async{
                    final CompleteProfile completeProfile = await createProfile(
                      firstName.text,lastName.text,email.text,password.text
                    );
                    setState(() {
                      _completeProfile = completeProfile;
                    });
                    if (_completeProfile.status == 1) {
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return CustomDialogBox(message: _completeProfile.message,icon: Icons.error_outline,);
                          }
                      );
                      Navigator.push(context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: LoginScreen(
                                accessToken: widget.accessToken,
                              )));
                    }
                    else {
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return CustomDialogBox(message: _completeProfile.message,icon: Icons.error_outline,);
                          }
                      );
                    }
                  },
                  color: Color(0xff00A9A5),
                  child: Text(
                    'Finish',
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

