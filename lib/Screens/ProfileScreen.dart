import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/LogOut.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:gold/Screens/EditProfileScreen.dart';
import 'package:gold/Screens/LoginScreen.dart';
import 'package:gold/Screens/ProfileInfoScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'ChangePasswordScreen.dart';

class ProfileScreen extends StatefulWidget {
  var accessToken;
  var firstName;
  var lastName;
  var email;
  var phoneNumber;
  PageController myPage;
  ProfileScreen(
      {this.accessToken,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.myPage
      });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  LogOut _logOut;

  Future<LogOut> signOut() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url,
        headers: {"key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"},
        body: {"accessToken": widget.accessToken, "action": "customer/logout"});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return LogOut.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        'At Profile Screen -------------------------------------------> ${widget.accessToken}');
   return WillPopScope(
     onWillPop: () => Future.sync(onWillPop),
   child: Material(
     child: Scaffold(
       backgroundColor: Colors.black,
       appBar: AppBar(
         backgroundColor: Colors.black,
         title: Container(
           alignment: Alignment.center,
           padding: EdgeInsets.only(right: SizeConfig.widthMultiplier * 10),
           child: Text(
             'Profile',
             style: CustomFonts.googleHeaderFont(
                 color: Colors.white,
                 fontSize: SizeConfig.textMultiplier * 4,
                 fontWeight: FontWeight.bold),
           ),
         ),
       ),
       body: ListView(
         padding: EdgeInsets.only(
             top: SizeConfig.heightMultiplier * 4,
             left: SizeConfig.widthMultiplier * 2,
             right: SizeConfig.widthMultiplier * 2),
         children: [
           Container(
             height: SizeConfig.heightMultiplier * 30,
             padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 4),
             decoration: BoxDecoration(
                 color: Color(0xff2F3541),
                 borderRadius: BorderRadius.circular(20)),
             child: Column(
               children: [
                 Expanded(
                   flex: 3,
                   child: Container(
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(
                           image: AssetImage('images/face.jpg'),
                         )),
                   ),
                 ),
                 Expanded(
                   flex: 2,
                   child: Container(
                     padding:
                     EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                     child: Text(
                       '${widget.firstName + " " + widget.lastName}',
                       style: CustomFonts.googleHeaderFont(
                           color: Colors.white,
                           fontSize: SizeConfig.textMultiplier * 3.5),
                     ),
                   ),
                 )
               ],
             ),
           ),
           SizedBox(
             height: SizeConfig.heightMultiplier * 2,
           ),
           InkWell(
             onTap: () {
               Navigator.push(
                   context,
                   PageTransition(
                       type: PageTransitionType.leftToRight,
                       child: ChangePasswordScreen(
                           accessToken: widget.accessToken)));
             },
             child: Container(
               height: SizeConfig.heightMultiplier * 9,
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle, color: Color(0xff2A2E36)),
                       child: Icon(
                         Icons.lock,
                         color: Color(0xff76777D),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 4,
                     child: Container(
                       padding: EdgeInsets.only(
                           left: SizeConfig.widthMultiplier * 3),
                       child: Text(
                         'Change Password',
                         style: CustomFonts.googleBodyFont(
                             color: Color(0xffD2D3D5),
                             fontSize: SizeConfig.textMultiplier * 2.5),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Container(
                       alignment: Alignment.centerRight,
                       child: Icon(
                         Icons.arrow_forward_ios,
                         color: Color(0xffD2D3D5),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
           SizedBox(
             height: SizeConfig.heightMultiplier * 2,
           ),
           InkWell(
             onTap: () {
               Navigator.push(
                   context,
                   PageTransition(
                       type: PageTransitionType.leftToRight,
                       child: EditProfileScreen(
                         firstName: widget.firstName,
                         lastName: widget.lastName,
                         accessToken: widget.accessToken,
                         email: widget.email,
                         phoneNumber: widget.phoneNumber,
                       )));
             },
             child: Container(
               height: SizeConfig.heightMultiplier * 9,
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle, color: Color(0xff2A2E36)),
                       child: Icon(
                         Icons.settings_rounded,
                         color: Color(0xff76777D),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 4,
                     child: Container(
                       padding: EdgeInsets.only(
                           left: SizeConfig.widthMultiplier * 3),
                       child: Text(
                         'Edit Profile',
                         style: CustomFonts.googleBodyFont(
                             color: Color(0xffD2D3D5),
                             fontSize: SizeConfig.textMultiplier * 2.5),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Container(
                       alignment: Alignment.centerRight,
                       child: Icon(
                         Icons.arrow_forward_ios,
                         color: Color(0xffD2D3D5),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
           SizedBox(
             height: SizeConfig.heightMultiplier * 2,
           ),
           InkWell(
             onTap: () {
               Navigator.push(
                   context,
                   PageTransition(
                       type: PageTransitionType.leftToRight,
                       child: ProfileInfo()));
             },
             child: InkWell(
               onTap: () async {
                 final LogOut logOut = await signOut();
                 setState(() {
                   _logOut = logOut;
                 });
                 if (_logOut.status == 1) {
                   showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return CustomDialogBox(
                           message: _logOut.message,
                           icon: Icons.check,
                         );
                       });
                   // SharedPreferences prefs = await SharedPreferences.getInstance();
                   // prefs?.setBool("isLoggedIn", false);
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
                 } else {
                   showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return CustomDialogBox(
                           message: _logOut.message,
                           icon: Icons.error_outline,
                         );
                       });
                 }
               },
               child: Container(
                 height: SizeConfig.heightMultiplier * 9,
                 child: Row(
                   children: [
                     Expanded(
                       child: Container(
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle, color: Color(0xff2A2E36)),
                         child: Icon(
                           Icons.logout,
                           color: Color(0xff76777D),
                         ),
                       ),
                     ),
                     Expanded(
                       flex: 4,
                       child: Container(
                         padding: EdgeInsets.only(
                             left: SizeConfig.widthMultiplier * 3),
                         child: Text(
                           'Logout',
                           style: CustomFonts.googleBodyFont(
                               color: Color(0xffD2D3D5),
                               fontSize: SizeConfig.textMultiplier * 2.5),
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         alignment: Alignment.centerRight,
                         child: Icon(
                           Icons.arrow_forward_ios,
                           color: Color(0xffD2D3D5),
                         ),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
         ],
       ),
     ),
   ),
   );
  }
  bool onWillPop() {
    widget.myPage.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    return false;
  }
}
