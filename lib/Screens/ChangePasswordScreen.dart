import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Models/UpdatePassword.dart';
import 'package:http/http.dart' as http;
import '../Constants/SizeConfig.dart';
import 'CustomDialog.dart';
import 'package:gold/Constants/Globals.dart';

class ChangePasswordScreen extends StatefulWidget {
  var accessToken;

  ChangePasswordScreen({this.accessToken});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newConfirmPassword = TextEditingController();
  var padding = 8.0;
  var height = SizeConfig.heightMultiplier * 50;
  var width = SizeConfig.widthMultiplier * 100;

  UpdatePassword _updatePassword;

  Future<UpdatePassword> changePassword(
      {String oldPassword, newPassword, newConfirmPassword}) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": "${widget.accessToken}",
      "action": "customer/updatePassword",
      "oldPassword": "$oldPassword",
      "newPassword": "$newPassword",
      "newConfirmPassword": "$newConfirmPassword",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return UpdatePassword.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        "At password Screen  -----------------------------> ${widget.accessToken}");
    return Material(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
          child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          Text(
            'Change Password',
            style: CustomFonts.googleHeaderFont(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 4,
                fontWeight: FontWeight.bold),
          ):
          Text(
            'تغيير كلمة المرور',
            style: CustomFonts.googleHeaderFont(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 4,
                fontWeight: FontWeight.bold),
          )
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 8,
            ),
            textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?'Old Password':'كلمة المرور القديمة', Icons.lock, true,
                controller: oldPassword),
            textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?'New Password':'كلمة المرور الجديدة', Icons.lock, true,
                controller: newPassword),
            textField(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?'Confirm Password':'تأكيد كلمة المرور'
            , Icons.lock, true,
                controller: newConfirmPassword),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.heightMultiplier * 10,
        width: double.infinity,
        margin: EdgeInsets.only(
            left: SizeConfig.widthMultiplier * 2,
            right: SizeConfig.widthMultiplier * 2,
            bottom: SizeConfig.heightMultiplier * 2),
        child: RaisedButton(
          color: Color(0xff00A9A5),
          onPressed: () async {
            final UpdatePassword updatePassword = await changePassword(
                oldPassword: oldPassword.text,
                newPassword: newPassword.text,
                newConfirmPassword: newConfirmPassword.text);
            setState(() {
              _updatePassword = updatePassword;
            });
            if (_updatePassword.status == 1) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      message: _updatePassword.message,
                      icon: Icons.check,
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      message: _updatePassword.message,
                      icon: Icons.error_outline,
                    );
                  });
            }
          },
          child:App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          Text(
            'Change Password',
            style: CustomFonts.googleBodyFont(
                color: Colors.white, fontSize: SizeConfig.textMultiplier * 3),
          ):
          Text(
            'تغيير كلمة المرور',
            style: CustomFonts.googleBodyFont(
                color: Colors.white, fontSize: SizeConfig.textMultiplier * 3),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    ));
  }

  Widget textField(String labell, var icon, bool val, {var controller}) {
    final node = FocusScope.of(context);
    return Container(
      margin:
          EdgeInsets.only(left: padding * 4, right: padding * 4, top: padding
              //vertical: padding
              ),
      padding: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 0.8,
      ),
      height: height * 0.18,
      child: TextField(
        onEditingComplete: () => node.nextFocus(),
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
              borderSide: BorderSide(color: Color(0xff00A9A5), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(padding * 0.5),
              borderSide: BorderSide(color: Color(0xff00A9A5), width: 2),
            ),
            suffixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: '$labell',
            hintStyle: CustomFonts.googleBodyFont(color: Color(0xff00A9A5))),
      ),
    );
  }
}
