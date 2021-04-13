import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import '../Constants/SizeConfig.dart';

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
        padding: EdgeInsets.all(10),
        height: SizeConfig.heightMultiplier * 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  widget.icon,
                  color: Color(0xff00A9A5),
                  size: SizeConfig.textMultiplier * 10,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(widget.message,
                style: CustomFonts.googleBodyFont(
                  color: Color(0xff00A9A5),
                ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: SizeConfig.widthMultiplier * 20,
                  decoration: BoxDecoration(
                    color: Color(0xff00A9A5),
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
            )
          ],
        ),
      ),
    );
  }
}
