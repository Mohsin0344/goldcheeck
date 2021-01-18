
import 'package:flutter/material.dart';
import 'package:gold/SizeConfig.dart';
class testing extends StatefulWidget {
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(

              flex: 1,

              child: Container(
                color: Colors.red,


              )
          ),

          Expanded(

              flex:SizeConfig.isMobilePortrait?1:3,

              child: Container(
                color: Colors.black,


              )
          ),
        ],
      ),
    );
  }
}
