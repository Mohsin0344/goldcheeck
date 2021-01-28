import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Screens/EditProfileScreen.dart';
import 'package:gold/Screens/ProfileInfoScreen.dart';
import 'package:gold/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';

import 'ChangePasswordScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              right: SizeConfig.widthMultiplier * 10
            ),
            child: Text('Profile',
            style: CustomFonts.googleHeaderFont(
              color: Colors.white,
              fontSize: SizeConfig.textMultiplier * 4,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(
            top: SizeConfig.heightMultiplier * 4,
            left: SizeConfig.widthMultiplier * 2,
            right: SizeConfig.widthMultiplier * 2
          ),
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 30,
              padding: EdgeInsets.only(
                  top: SizeConfig.widthMultiplier * 4
              ),
              decoration: BoxDecoration(
                color: Color(0xff2F3541),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/face.jpg'),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: SizeConfig.heightMultiplier * 2
                      ),
                      child: Text(
                        'Jasem Dashti',
                        style: CustomFonts.googleHeaderFont(
                          color: Colors.white,
                          fontSize: SizeConfig.textMultiplier * 3.5
                        ),
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
              onTap: (){
                Navigator.push(context, PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: ChangePasswordScreen()
                )
                );
              },
              child: Container(
                height: SizeConfig.heightMultiplier * 9,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff2A2E36)
                        ),
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
                          left: SizeConfig.widthMultiplier * 3
                        ),
                        child: Text(
                          'Change Password',
                          style: CustomFonts.googleBodyFont(
                            color: Color(0xffD2D3D5),
                            fontSize: SizeConfig.textMultiplier * 2.5
                          ),
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
              onTap: (){
                Navigator.push(context, PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: EditProfileScreen()
                )
                );
              },
              child: Container(
                height: SizeConfig.heightMultiplier * 9,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff2A2E36)
                        ),
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
                            left: SizeConfig.widthMultiplier * 3
                        ),
                        child: Text(
                          'Edit Profile',
                          style: CustomFonts.googleBodyFont(
                              color: Color(0xffD2D3D5),
                              fontSize: SizeConfig.textMultiplier * 2.5
                          ),
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
              onTap: (){
                Navigator.push(context, PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: ProfileInfo()
                )
                );
              },
              child: Container(
                height: SizeConfig.heightMultiplier * 9,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff2A2E36)
                        ),
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
                            left: SizeConfig.widthMultiplier * 3
                        ),
                        child: Text(
                          'Logout',
                          style: CustomFonts.googleBodyFont(
                              color: Color(0xffD2D3D5),
                              fontSize: SizeConfig.textMultiplier * 2.5
                          ),
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
          ],
        ),
      ),
    );
  }
}
