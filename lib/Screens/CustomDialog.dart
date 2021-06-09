import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Screens/HomeScreen.dart';
import '../Constants/SizeConfig.dart';
import 'package:gold/Constants/ConstantColors.dart';

class CustomDialogBox extends StatefulWidget {
  var icon;
  var message;
  var check;

  CustomDialogBox({this.icon, this.message,this.check});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
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

  contentBox(context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top:10,
            left: 10,
            right: 10,
            bottom: 15
        ),
        height: SizeConfig.heightMultiplier * 30,
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
              flex: 2,
              child: Container(
                alignment: Alignment.topCenter,
                child: Icon(
                  widget.icon,
                  color: ConstantColors.buttonColor,
                  size: SizeConfig.textMultiplier * 10,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(widget.message,
                style: CustomFonts.googleBodyFont(
                  color: ConstantColors.buttonColor,
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
                      onTap: (){
                        if(widget.check == null) Navigator.pop(context);
                        else  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen(
                          firstName: App.localStorage.getString("firstName"),
                          lastName: App.localStorage.getString("lastName"),
                          isVIP: App.localStorage.getInt("isVIP"),
                          walletCredit:
                          App.localStorage.getInt("walletCredit"),
                          accessToken: App.localStorage.getString('accessToken'),
                          email: App.localStorage.getString("email"),
                          phoneNumber: App.localStorage.getString("phoneNumber"),
                        )), (Route<dynamic> route) => false);
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
                            'OK',
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
                              'Cancel',
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
