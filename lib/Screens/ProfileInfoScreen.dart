// import 'package:flutter/material.dart';
// import 'package:gold/Constants/Constants.dart';
// import 'package:gold/SizeConfig.dart';
// import 'package:page_transition/page_transition.dart';
//
//
// import 'HomeScreen.dart';
//
// class ProfileInfo extends StatefulWidget {
//   @override
//   _ProfileInfoState createState() => _ProfileInfoState();
// }
//
// class _ProfileInfoState extends State<ProfileInfo> {
//   var height = SizeConfig.imageSizeMultiplier * 100;
//   var width = SizeConfig.imageSizeMultiplier * 200;
//   var padding = CustomSizes.padding;
//
//   @override
//   Widget build(BuildContext context) {
//     print(SizeConfig.isMobilePortrait);
//     return  SafeArea(
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           body: Container(
//             width: double.infinity,
//             padding: EdgeInsets.only(
//                 left: padding,
//                 right: padding
//             ),
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xffC1A035),
//                       Color(0xff2B2921),
//                     ]
//                 )
//             ),
//             child: Container(
//               margin: EdgeInsets.only(
//                 top: padding * 0
//               ),
//               child: Column(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     //fit: FlexFit.loose,
//                     child: Container(
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: padding * 2
//                       ),
//                       height: height * 0.30,
//                       child: Text(
//                         'Logo here',
//                         style: CustomFonts.googleBodyFont(
//                           color: Colors.white,
//                           fontSize: 70
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: SizedBox(height: height * 2,),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       height: height * 0.35,
//                       child: ListView(
//                         children: [

//                         ],
//                       ),
//                     ),
//                   ),
//

//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//   }
//   Widget textField(String labell, var icon, bool val){
//     return Container(
//       margin: EdgeInsets.only(
//           left: padding * 4,
//         right: padding * 4,
//         top: padding
//         //vertical: padding
//       ),
//       height: height * 0.15,
//       child: TextField(
//         style: CustomFonts.googleBodyFont(
//             color: Colors.black
//         ),
//         cursorColor: Color(0xff00A9A5),
//         obscureText: val,
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.white,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(padding * 0.5),
//               borderSide: BorderSide(
//                   color: Color(0xff00A9A5),
//                   width: 1
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(padding * 0.5),
//               borderSide: BorderSide(
//                   color: Color(0xff00A9A5),
//                   width: 2
//               ),
//             ),
//             suffixIcon: Icon(
//               icon,
//               color: Colors.grey,
//             ),
//             labelText: '$labell',
//             labelStyle: CustomFonts.googleBodyFont(
//                 color: Color(0xff00A9A5)
//             )
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';


import 'HomeScreen.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.isMobilePortrait);
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
                  height: SizeConfig.heightMultiplier * 10,
                  child: Text(
                    'Logo here',
                    style: CustomFonts.googleBodyFont(
                      color: Colors.white,
                      fontSize: SizeConfig.textMultiplier * 8
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 20,
                ),
                textField('Your Name', Icons.supervisor_account, false),
                textField('Email Address', Icons.mail_outline_outlined,  false),
                textField('Password', Icons.lock, true),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 8,
                    vertical: SizeConfig.heightMultiplier * 8,
                ),
                height: SizeConfig.heightMultiplier * 8,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: HomeScreen()));
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
  Widget textField(String labell, var icon, bool val){
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
            labelText: '$labell',
            labelStyle: CustomFonts.googleBodyFont(
                color: Color(0xff00A9A5)
            )
        ),
      ),
    );
  }
}

