import 'dart:io';
import 'package:gold/Constants/ConstantColors.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/LogOut.dart';
import 'package:gold/Models/UpdateProfileModel.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:gold/Screens/EditProfileScreen.dart';
import 'package:gold/Screens/HomeScreen.dart';
import 'package:gold/Screens/LoginScreen.dart';
import 'package:gold/Screens/ProfileInfoScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'ChangePasswordScreen.dart';
import 'package:gold/Models/GetProfileImage.dart';

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
  GetProfileImage _getProfileImage;
  File _image;
  final picker = ImagePicker();
  var _path;
  int _value = 1;


  Future<GetProfileImage> getProfileImage() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url,
        headers: {"key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"},
        body: {"accessToken": widget.accessToken,
          "action": "customer/getprofileimage",
        });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print("this iss      ${responseString.toString()}");
      return GetProfileImage.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  Future<UpdateProfile> updateProfilePhoto(File pic) async {
    var headers = {
      'key': '542A9M87SDKL2M728WQIMC4DSQLU9LL3',
      'Cookie': 'PHPSESSID=ogie09t8iq6476t0uu6p4gvn8n'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://15.185.204.189/webapi/server.php'));
    request.fields.addAll({
      'action': 'customer/updateProfilePhoto',
      'accessToken': widget.accessToken,
    });
    request.files.add(await http.MultipartFile.fromPath('name', pic.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getProfileImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'At Profile Screen -------------------------------------------> ${widget.accessToken}');
   return WillPopScope(
     onWillPop: () => Future.sync(onWillPop),
   child: Material(
     child: Scaffold(
       backgroundColor: Color(0xffF6F7F9),
       appBar: AppBar(
         actions: [
           DropdownButton(
             icon: Icon(
               Icons.keyboard_arrow_down_outlined
             ),
             dropdownColor: ConstantColors.backgroundColor,
             value: App.localStorage.getString("lang")== "en" ? 1 : 2,
             items: [
               DropdownMenuItem(
                 value: 1,
                 child: Text('ENG',
                 style: CustomFonts.googleHeaderFont(
                   color: Colors.black,
                   fontSize: SizeConfig.textMultiplier * 1.6
                 ),
                 ),
               ),
               DropdownMenuItem(
                 value: 2,
                 child: Text('عربى',
                   style: CustomFonts.googleHeaderFont(
                       color: Colors.black
                   ),
                 ),
               )
             ],
           onChanged: (value) {
             setState(() async{
               _value = value;
               if(_value == 1) {
                 await App.init();
                 await App.localStorage.setString("lang", "en");
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen(
                   firstName: App.localStorage.getString("firstName"),
                   lastName: App.localStorage.getString("lastName"),
                   isVIP: App.localStorage.getInt("isVIP"),
                   walletCredit:
                   App.localStorage.getInt("walletCredit"),
                   accessToken: App.localStorage.getString('accessToken'),
                   email: App.localStorage.getString("email"),
                   phoneNumber: App.localStorage.getString("phoneNumber"),
                 )), (Route<dynamic> route) => false);
               }
               else if(_value == 2) {
                 await App.init();
                 await App.localStorage.setString("lang", "ar");
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen(
                   firstName: App.localStorage.getString("firstName"),
                   lastName: App.localStorage.getString("lastName"),
                   isVIP: App.localStorage.getInt("isVIP"),
                   walletCredit:
                   App.localStorage.getInt("walletCredit"),
                   accessToken: App.localStorage.getString('accessToken'),
                   email: App.localStorage.getString("email"),
                   phoneNumber: App.localStorage.getString("phoneNumber"),
                 )), (Route<dynamic> route) => false);
               }
             });
           }),
         ],
         // leading: Icon(
         //   Icons.arrow_back,
         //   color: ConstantColors.buttonColor,
         // ),
         centerTitle: true,
         backgroundColor: ConstantColors.backgroundColor,
         title: Container(
           child:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
           Text(
             'Profile',
             style: CustomFonts.googleHeaderFont(
                 color: ConstantColors.textColor,
                 fontSize: SizeConfig.textMultiplier * 2.2,
                 fontWeight: FontWeight.bold),
           ):
           Text(
             'الملف الشخصي',
             style: CustomFonts.googleHeaderFont(
                 color: ConstantColors.textColor,
                 fontSize: SizeConfig.textMultiplier * 2.2,
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
             height: SizeConfig.heightMultiplier * 20,
             padding: EdgeInsets.only(top: SizeConfig.widthMultiplier * 4),
             decoration: BoxDecoration(
                 color: ConstantColors.backgroundColor,
                 borderRadius: BorderRadius.circular(20)),
             child: Stack(
               children: [
               FutureBuilder(
                 future: getProfileImage(),
                 builder: (BuildContext context, snapshot){
                   if(snapshot.hasData){
                     return   Container(
                       height: SizeConfig.heightMultiplier * 13,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           image: DecorationImage(
                             image: NetworkImage(snapshot.data.data),
                             fit: BoxFit.fill
                             )
                              ),
                     );
                   } else {
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                 },
               ),
                 Positioned(
                   right: SizeConfig.widthMultiplier * 35,
                   top: SizeConfig.heightMultiplier * 9,
                   child: Align(
                     alignment: Alignment.centerRight,
                     child: Container(
                       decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: ConstantColors.buttonColor
                       ),
                       child: InkWell(
                         onTap: () async {
                           await _pickImageFromGallery();
                         },
                         child: Icon(
                           Icons.add,
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   bottom: SizeConfig.heightMultiplier * 1.5,
                   //left: SizeConfig.widthMultiplier * 35,
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: Container(
                       width: SizeConfig.widthMultiplier * 100,
                       alignment: Alignment.center,
                       padding:
                       EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                       child: Text(
                         '${widget.firstName + " " + widget.lastName}',
                         style: CustomFonts.googleHeaderFont(
                             color: ConstantColors.textColor,
                             fontSize: SizeConfig.textMultiplier * 2),
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
             onTap: () {
               Navigator.push(
                   context,
                   PageTransition(
                       type: PageTransitionType.leftToRight,
                       child: ChangePasswordScreen(
                           accessToken: widget.accessToken)));
             },
             child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
             Container(
               height: SizeConfig.heightMultiplier * 7,
               padding: EdgeInsets.all(8),
               decoration: BoxDecoration(
                 color: ConstantColors.backgroundColor,
                 borderRadius: BorderRadius.circular(5.0),
               ),
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle, //color: ConstantColors.buttonColor
                          ),
                       child: Icon(
                         Icons.lock,
                         size: SizeConfig.textMultiplier * 2.5,
                         color: ConstantColors.buttonColor,
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 4,
                     child: Container(
                       alignment: Alignment.centerLeft,
                       padding: EdgeInsets.only(
                           left: SizeConfig.widthMultiplier * 3),
                       child: Text(
                         'Change Password',
                         style: CustomFonts.googleBodyFont(
                             color: ConstantColors.textColor,
                             fontSize: SizeConfig.textMultiplier * 2,
                         fontWeight: FontWeight.bold),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Container(
                       alignment: Alignment.centerRight,
                       child: Icon(
                         Icons.arrow_forward_ios,
                         size: SizeConfig.textMultiplier * 2,
                         color: ConstantColors.textColor,
                       ),
                     ),
                   )
                 ],
               ),
             ) :
             Container(
               padding: EdgeInsets.all(8),
               height: SizeConfig.heightMultiplier * 7,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5.0),
                 color: ConstantColors.backgroundColor
               ),
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.only(
                         left: SizeConfig.widthMultiplier * 2
                       ),
                       alignment: Alignment.centerLeft,
                       child: Icon(
                         Icons.arrow_back_ios,
                         size: SizeConfig.textMultiplier * 2,
                         color: ConstantColors.buttonColor,
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 4,
                     child: Container(
                       alignment: Alignment.centerRight,
                       padding: EdgeInsets.only(
                           right: SizeConfig.widthMultiplier * 0),
                       child: Text(
                         'تغيير كلمة المرور',
                         style: CustomFonts.googleBodyFont(
                             color: ConstantColors.textColor,
                             fontSize: SizeConfig.textMultiplier * 2,
                         fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Container(
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle, //color: ConstantColors.buttonColor
                       ),
                       child: Icon(
                         Icons.lock,
                         size: SizeConfig.textMultiplier * 2.5,
                         color: ConstantColors.buttonColor,
                       ),
                     ),
                   ),
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
             child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
             Container(
               height: SizeConfig.heightMultiplier * 7,
               padding: EdgeInsets.all(8),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5.0),
                 color: ConstantColors.backgroundColor,
               ),
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle, //color: ConstantColors.buttonColor
                       ),
                       child: Icon(
                         Icons.settings,
                         size: SizeConfig.textMultiplier * 2.5,
                         color: ConstantColors.buttonColor,
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
                             color: ConstantColors.textColor,
                             fontSize: SizeConfig.textMultiplier * 2,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Container(
                       alignment: Alignment.centerRight,
                       child: Icon(
                         Icons.arrow_forward_ios,
                         size: SizeConfig.textMultiplier * 2,
                         color: ConstantColors.textColor,
                       ),
                     ),
                   )
                 ],
               ),
             ) :
             Container(
               height: SizeConfig.heightMultiplier * 7,
               padding: EdgeInsets.all(8.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5.0),
                 color: ConstantColors.backgroundColor,
               ),
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.only(
                           left: SizeConfig.widthMultiplier * 2
                       ),
                       alignment: Alignment.centerLeft,
                       child: Icon(
                         Icons.arrow_back_ios,
                         size: SizeConfig.textMultiplier * 2,
                         color: ConstantColors.buttonColor,
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 4,
                     child: Container(
                       alignment: Alignment.centerRight,
                       padding: EdgeInsets.only(
                           right: SizeConfig.widthMultiplier * 3),
                       child: Text(
                         'تعديل الملف الشخصي',
                         style: CustomFonts.googleBodyFont(
                             color: ConstantColors.textColor,
                             fontSize: SizeConfig.textMultiplier * 2,
                         fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Container(
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           shape: BoxShape.circle, //color: ConstantColors.buttonColor
                       ),
                       child: Icon(
                         Icons.settings,
                         size: SizeConfig.textMultiplier * 2.5,
                         color: ConstantColors.buttonColor,
                       ),
                     ),
                   ),
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
                 showDialog(
                   context: context,
                   builder: (BuildContext context){
                     return LogoutDialog(
                       message: "logout",
                       icon: widget.accessToken,
                     );
                   }
                 );
               },
               child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
               Container(
                 height: SizeConfig.heightMultiplier * 7,
                 padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5.0),
                   color: ConstantColors.backgroundColor
                 ),
                 child: Row(
                   children: [
                     Expanded(
                       child: Container(
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle, //color: ConstantColors.buttonColor
                         ),
                         child: Icon(
                           Icons.logout,
                           size: SizeConfig.textMultiplier * 2,
                           color: ConstantColors.buttonColor,
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
                               color: ConstantColors.textColor,
                               fontSize: SizeConfig.textMultiplier * 2,
                           fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         alignment: Alignment.centerRight,
                         // child: Icon(
                         //   Icons.arrow_forward_ios,
                         //   size: SizeConfig.textMultiplier * 2,
                         //   color: ConstantColors.textColor,
                         // ),
                       ),
                     )
                   ],
                 ),
               ) :
               Container(
                 height: SizeConfig.heightMultiplier * 7,
                 padding: EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5.0),
                   color: ConstantColors.backgroundColor
                 ),
                 child: Row(
                   children: [
                     Expanded(
                       child: Container(
                         margin: EdgeInsets.only(
                             left: SizeConfig.widthMultiplier * 2
                         ),
                         alignment: Alignment.centerLeft,
                         // child: Icon(
                         //   Icons.arrow_back_ios,
                         //   size: SizeConfig.textMultiplier * 2,
                         //   color: ConstantColors.buttonColor,
                         // ),
                       ),
                     ),
                     Expanded(
                       flex: 4,
                       child: Container(
                         alignment: Alignment.centerRight,
                         padding: EdgeInsets.only(
                             right: SizeConfig.widthMultiplier * 3),
                         child: Text(
                           'تسجيل خروج',
                           style: CustomFonts.googleBodyFont(
                               color: ConstantColors.textColor,
                               fontSize: SizeConfig.textMultiplier * 2,
                           fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                             shape: BoxShape.circle, //color: ConstantColors.buttonColor
                         ),
                         child: Icon(
                           Icons.logout,
                           size: SizeConfig.textMultiplier * 2.5,
                           color: ConstantColors.buttonColor,
                         ),
                       ),
                     ),
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
  _pickImageFromGallery() async {
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery, imageQuality: 100);

    File image = File(pickedFile.path);
    print('image parh ********************************************************************************** $image');
    await updateProfilePhoto(image);
    // setState(() {
    //   _image = image;
    //   _path = pickedFile.path;
    // });
  }
}

class LogoutDialog extends StatefulWidget {
  var icon;
  var message;
  var check;

  LogoutDialog({this.icon, this.message,this.check});

  @override
  _LogoutDialogState createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  LogOut _logOut;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Future<LogOut> signOut() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url,
        headers: {"key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"},
        body: {"accessToken": widget.icon,
          "action": "customer/logout",
          "lang": App.localStorage.getString("lang"),
        });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print(responseString.toString());
      return LogOut.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }
  contentBox(context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top:10,
        left: 10,
          right: 10,
          bottom: 15
        ),
        height: SizeConfig.heightMultiplier * 20,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2)
        ),
        child: Column(
          children: [
            Expanded(
              //fit: FlexFit.loose,
              child: InkWell(
                onTap: ()=>Navigator.pop(context),
                child: Container(
                  alignment: Alignment.topRight,
                  height: 20,
                  child: Icon(
                    Icons.clear,
                    color: ConstantColors.buttonColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                //color: Colors.redAccent,
                alignment: Alignment.topLeft,
                child: Text(App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                "Are you sure you want to log out?" : "هل أنت متأكد أنك تريد تسجيل الخروج؟",
                  style: CustomFonts.googleBodyFont(
                    color: ConstantColors.buttonColor,
                    fontSize: SizeConfig.textMultiplier * 2.1
                  ),
                ),
              ),
            ),
            Flexible(
                fit: FlexFit.loose,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async{
                          final LogOut logOut = await signOut();
                          setState(() {
                            _logOut = logOut;
                          });
                          if (_logOut.status == 1) {
                            await App.init();
                            await App.localStorage.remove("accessToken");
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.widthMultiplier
                          ),
                          child: Container(
                            // width: SizeConfig.widthMultiplier * 20,
                            decoration: BoxDecoration(
                                color: ConstantColors.buttonColor,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            // padding: EdgeInsets.only(
                            //   right: SizeConfig.widthMultiplier * 2
                            // ),
                            alignment: Alignment.center,
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'LOGOUT':'تسجيل خروج',
                              style: CustomFonts.googleBodyFont(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: ConstantColors.buttonColor
                                )
                            ),
                            child: Center(
                              child: Text(
                                App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                'Cancel': 'إلغاء',
                                style: CustomFonts.googleBodyFont(
                                    color: ConstantColors.textColor
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}