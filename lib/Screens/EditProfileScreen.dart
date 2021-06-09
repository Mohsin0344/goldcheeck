import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Models/EditProfile.dart';
import 'package:http/http.dart' as http;
import '../Constants/SizeConfig.dart';
import 'CustomDialog.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/ConstantColors.dart';

class EditProfileScreen extends StatefulWidget {
  var firstName;
  var lastName;
  var accessToken;
  var phoneNumber;
  var email;

  EditProfileScreen(
      {this.accessToken,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  var padding = 8.0;
  var height = SizeConfig.heightMultiplier * 50;
  var width = SizeConfig.widthMultiplier * 100;

  EditProfile _editProfile;

  Future<EditProfile> updateProfileNow(
      {var firstName, lastName, mobileNumber}) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "customer/updateUser",
      "firstname": "$firstName",
      "lastname": "$lastName",
      "mobileNumber": "$mobileNumber",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return EditProfile.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
//    print('${widget.name.split(" ")[1]}');
    print(widget.accessToken);
    return Material(
        child: Scaffold(
      backgroundColor: ConstantColors.mainBackground,
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
              Icons.arrow_back,
              color: ConstantColors.buttonColor
          ),
        ),
        backgroundColor: ConstantColors.mainBackground,
        centerTitle: true,
        title: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
        Text(
          'Edit Profile',
          style: CustomFonts.googleHeaderFont(
              color: ConstantColors.textColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.bold),
        ):
        Text(
          'تعديل الملف الشخصي',
          style: CustomFonts.googleHeaderFont(
              color: ConstantColors.textColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 8,
            ),
            textField('${widget.firstName}', Icons.account_box, false,
                controller: firstName),
            textField('${widget.lastName}', Icons.account_box, false,
                controller: lastName),
            textField('${widget.phoneNumber}', Icons.phone, false,
                controller: mobileNumber),
            textField('${widget.email}', Icons.email, false, editable: false),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.heightMultiplier * 7,
        width: double.infinity,
        margin: EdgeInsets.only(
            left: SizeConfig.widthMultiplier * 2,
            right: SizeConfig.widthMultiplier * 2,
            bottom: SizeConfig.heightMultiplier * 2),
        child: RaisedButton(
          color: ConstantColors.buttonColor,
          onPressed: () async {
            final EditProfile editProfile = await updateProfileNow(
                firstName: firstName.text,
                lastName: lastName.text,
                mobileNumber: mobileNumber.text);
            setState(() {
              _editProfile = editProfile;
            });
            if (_editProfile.status == 1) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      message: _editProfile.message,
                      icon: Icons.check,
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      message: _editProfile.message,
                      icon: Icons.error_outline,
                    );
                  });
            }
          },
          child:App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          Text(
            'Update',
            style: CustomFonts.googleBodyFont(
                color: ConstantColors.textColor, fontSize: SizeConfig.textMultiplier * 2),
          ):   Text(
            'تحديث',
            style: CustomFonts.googleBodyFont(
                color: ConstantColors.textColor, fontSize: SizeConfig.textMultiplier * 2),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    ));
  }

  Widget textField(String labell, var icon, bool val,
      {bool editable, var controller}) {
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
        readOnly: editable != null ? true : false,
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
              color: ConstantColors.buttonColor,
            ),
            hintText: '$labell',
            hintStyle: CustomFonts.googleBodyFont(color: ConstantColors.textColor)),
      ),
    );
  }
}
