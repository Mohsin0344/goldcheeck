import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Screens/ProfileScreen.dart';
import 'package:page_transition/page_transition.dart';

import '../SizeConfig.dart';
import 'CustomDialog.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var padding = 8.0;
  var height = SizeConfig.heightMultiplier * 50;
  var width = SizeConfig.widthMultiplier * 100;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            padding: EdgeInsets.only(
              left: SizeConfig.widthMultiplier * 5
            ),
          child: Text('Change Password',
           style: CustomFonts.googleHeaderFont(
           color: Colors.white,
           fontSize: SizeConfig.textMultiplier * 4,
           fontWeight: FontWeight.bold
        ),
        ),
        ),
      ),
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 8,
              ),
              textField('Old Password', Icons.lock, true),
              textField('New Password', Icons.lock, true),
              textField('Confirm Password', Icons.lock, true),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: SizeConfig.heightMultiplier * 10,
          width: double.infinity,
          margin: EdgeInsets.only(
            left: SizeConfig.widthMultiplier * 2,
            right: SizeConfig.widthMultiplier * 2,
            bottom: SizeConfig.heightMultiplier * 2
          ),
          child: RaisedButton(
            color: Color(0xff00A9A5),
            onPressed:  (){
              showDialog(context: context,
                  builder: (BuildContext context){
                    return CustomDialogBox();
                  }
              );
              print('clicked');
            },
            child: Text(
              'Change Password',
              style: CustomFonts.googleBodyFont(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 3
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
      )
    );
  }Widget textField(String labell, var icon, bool val){
    return Container(
      margin: EdgeInsets.only(
          left: padding * 4,
          right: padding * 4,
          top: padding
        //vertical: padding
      ),
      padding: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 0.8,
      ),
      height: height * 0.18,
      child: TextField(
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
