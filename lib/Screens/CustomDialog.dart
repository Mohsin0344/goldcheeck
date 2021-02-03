import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../Constants/SizeConfig.dart';
import 'HomeScreen.dart';
import 'HomeScreenView.dart';

class CustomDialogBox extends StatefulWidget {
  var icon;
  var message;

  CustomDialogBox({this.icon, this.message});

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
        child: Column(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 25,
                  width: SizeConfig.heightMultiplier * 25,
                  decoration: BoxDecoration(
                      color: Color(0xff00A9A5), shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                      size: SizeConfig.textMultiplier * 20,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                child: Text(
                  '${widget.message}',
                  style: GoogleFonts.robotoMono(
                      color: Color(0xff00A9A5),
                      fontSize: SizeConfig.textMultiplier * 2.5,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
