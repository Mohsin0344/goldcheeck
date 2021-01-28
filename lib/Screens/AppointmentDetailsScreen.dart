
import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/SizeConfig.dart';

import 'package:page_transition/page_transition.dart';
import 'package:gold/Screens/PaymentScree.dart';

class AppointmentDetails extends StatefulWidget {
  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  var height = SizeConfig.heightMultiplier * 50;
  var width = SizeConfig.widthMultiplier * 100;
  var padding = CustomSizes.padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Book an appointment',
            style: CustomFonts.googleBodyFont(
                color: Colors.white
            ),
          ),
        ),
        leading: Icon(
            Icons.arrow_back,
            color: Colors.white
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: height * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: padding,
                        bottom: padding
                    ),
                    height: SizeConfig.isMobilePortrait?height * 0.25:height * 0.20,
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
                                  Flexible(
                                      flex: 2,
                                      fit: FlexFit.loose,
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
                                  Flexible(
                                      flex: 2,
                                      fit: FlexFit.loose,
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
                                          '3',
                                          style: CustomFonts.googleBodyFont(
                                              color: Colors.white
                                          ),
                                        )
                                    ),
                                  ),
                                  Flexible(
                                      flex: 2,
                                      fit: FlexFit.loose,
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
                                          color:    Color(0xff00A9A5),
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
                                                  color: Colors.grey,
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
                                              'Summary',
                                              style: CustomFonts.googleBodyFont(
                                                  color: Colors.white,
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
                ),
                // Expanded(
                //   flex: SizeConfig.isMobilePortrait? 5: 1,
                //   child: Container(
                //     margin: EdgeInsets.only(top: padding),
                //     color: Colors.red,
                //   ),
                // )
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
              left: padding * 2,
              right: padding * 2,
              top: padding
          ),
          child: Container(
            height: height * 0.12,
            width: width,
            child: Text(
              'Appointment Details',
              style: CustomFonts.googleBodyFont(
                  color: Colors.grey,
                  fontSize: 20
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left:padding * 2,
              right: padding * 2
          ),
          height: height * 0.7,
          decoration: BoxDecoration(
              color: Color(0xff3B3F52),
              borderRadius: BorderRadius.circular(padding)
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5
                          )
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Time:',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                                text: '11:am',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white
                                ),
                                children: [
                                  TextSpan(
                                    text: '   28 Jun 2018',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Change',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                        fontSize: SizeConfig.textMultiplier * 1.8
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5
                          )
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Service',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                                text: 'Haircut Plus',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white
                                ),
                                children: [
                                  TextSpan(
                                    text: '',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Change',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                          fontSize: SizeConfig.textMultiplier * 1.8
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey,
                              width: 0.5
                          )
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Stylist:',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: RichText(
                            text: TextSpan(
                                text: 'Carla',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white
                                ),
                                children: [
                                  TextSpan(
                                    text: '',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text('Change',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                          fontSize: SizeConfig.textMultiplier * 1.8
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: padding
          ),
          child: Divider(
            indent: 2,
            endIndent: 2,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: padding * 2,
              right: padding * 2,
              top: padding
          ),
          child: Container(
            height: height * 0.12,
            width: width,
            child: Text(
              'Payment details',
              style: CustomFonts.googleBodyFont(
                  color: Colors.grey,
                  fontSize: 20
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(
                left: padding * 2,
                right: padding * 2
            ),
            height: height * 0.33,
            decoration: BoxDecoration(
                color: Color(0xff3B3F52),
                borderRadius: BorderRadius.circular(padding)
            ),
            child: Column(
                children: [
                  Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: padding * 2
                                  ),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'upper payment fee',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.white.withOpacity(0.7),
                                            fontSize: 18
                                        ),
                                      )
                                  ),
                                )
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: padding * 2

                                  ),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.warning_amber_outlined,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: padding * 2
                                  ),
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Use in app credit',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.white.withOpacity(0.7),
                                            fontSize: 18
                                        ),
                                      )
                                  ),
                                )
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: padding * 2

                                  ),
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '-13 credit',
                                        style: CustomFonts.googleBodyFont(
                                          color: Color(0xff00A9A5),
                                        ),
                                      )
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                  ),
                ]
            )
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
                            child: PaymentScreen()
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

