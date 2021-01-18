import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Screens/AppointmentDetailsScreen.dart';
import 'package:gold/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var height = SizeConfig.heightMultiplier * 50;
  var width = SizeConfig.widthMultiplier * 100;
  var padding = CustomSizes.padding;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Text(
            'Book an appointment',
            style: CustomFonts.googleHeaderFont(
                color: Colors.white
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: padding,
                bottom: padding
            ),
            height: height * 0.25,
            margin: EdgeInsets.only(
                top: padding,
                left: padding,
                right: padding
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(0xff3B3F52),
                        width: 1
                    )
                )
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff3B3F52),
                                ),
                                child: Text(
                                  '1',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              //fit: FlexFit.loose,
                              child: Container(
                                height: height * 0.02,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Color(0xff3B3F52),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff3B3F52),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff3B3F52),
                                ),
                                child: Text(
                                  '2',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              // fit: FlexFit.loose,
                              child: Container(
                                height: height * 0.02,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Color(0xff3B3F52),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff1D747B),
                                                  Color(0xff3ABCB8)
                                                ]
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff00A9A5),
                                ),
                                child: Text(
                                  '3',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              //fit: FlexFit.loose,
                              child: Container(
                                height: height * 0.02,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Color(0xff3B3F52),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Color(0xff3B3F52),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff3B3F52),
                                ),
                                child: Text(
                                  '4',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white
                                  ),
                                )
                            ),
                          ),


                        ],
                      ),
                    )
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(
                                        left: padding * 0.5
                                    ),
                                    child: Text(
                                      'Login',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.grey,
                                        fontSize: SizeConfig.textMultiplier * 2
                                      ),
                                    )
                                )
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(
                                        right: SizeConfig.widthMultiplier * 2
                                    ),
                                    child: Text(
                                      'Choose Services',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.grey,
                                          fontSize: SizeConfig.textMultiplier * 1.8
                                      ),
                                    )
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(
                                        right: padding
                                    ),
                                    child: Text(
                                      'Pick Time',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                          fontSize: SizeConfig.textMultiplier * 2
                                      ),
                                    )
                                )
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    padding: EdgeInsets.only(
                                        right: padding * 0
                                    ),
                                    child: Text(
                                      'Payment',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.grey,
                                        fontSize: SizeConfig.textMultiplier * 1.8
                                      ),
                                    )
                                )
                            ),
                          ]
                      )
                  ),
                ),
              ],
            ),
          ),
          //////////////////////////////////////////////////////////////
          Container(
            margin: EdgeInsets.only(
                top: padding
            ),
            height:  height * 1,
            color: Color(0xff3B3F52),
          ),
          Container(
            height: height * 0.15,
            alignment: Alignment.center,
            child: Text(
              'Choose Stylist (Optional)',
              style: CustomFonts.googleHeaderFont(
                  color: Colors.white
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: padding
            ),
            height: height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, index){
                return Container(
                  height: height * 0.18,
                  width: width * 0.40,
                  decoration: BoxDecoration(
                      color: Color(0xffD4AF37),
                      borderRadius: BorderRadius.circular(padding)
                  ),
                  margin: EdgeInsets.only(
                      left: padding
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: Padding(
                          padding: EdgeInsets.all(padding * 0.5),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/face.jpg'),
                                    fit: BoxFit.cover
                                ),
                                border: Border.all(
                                    color: Colors.white,
                                    width: 1
                                )
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Christia Frank',
                            style: CustomFonts.googleHeaderFont(
                                color: Colors.white,
                              fontSize: SizeConfig.textMultiplier * 1.8
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.18,
        width: width,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: ' 30.00kd',
                      style: CustomFonts.googleBodyFont(
                        color: Color(0xff00A9A5),
                      ),
                      children: [
                        TextSpan(
                          text: '   Total',
                          style: CustomFonts.googleBodyFont(
                              color: Colors.grey
                          ),
                        )
                      ]
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(
                    padding
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: AppointmentDetails()
                        )
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                        color: Color(0xff00A9A5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Next',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

