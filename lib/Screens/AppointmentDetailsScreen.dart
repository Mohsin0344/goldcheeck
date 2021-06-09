import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gold/Screens/PaymentScree.dart';
import 'package:gold/Constants/ConstantColors.dart';

class AppointmentDetails extends StatefulWidget {
  var time;
  var price;
  var date;
  var idCart;
  var accessToken;
  var stylistName;
  AppointmentDetails({this.price,this.time,this.date,this.idCart,this.accessToken,this.stylistName});
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
      backgroundColor: ConstantColors.mainBackground,
      appBar: AppBar(
        backgroundColor: ConstantColors.mainBackground,
        centerTitle: true,
        title: Text(
          App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          'Book an appointment': 'احجز موعدًا',
          style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
        ),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: ConstantColors.buttonColor)),
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
                    padding: EdgeInsets.only(top: padding, bottom: padding),
                    height: SizeConfig.isMobilePortrait
                        ? height * 0.25
                        : height * 0.20,
                    margin: EdgeInsets.only(
                        top: padding, left: padding, right: padding),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: ConstantColors.backgroundColor, width: 1))),
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
                                          color: ConstantColors.buttonColor,
                                        ),
                                        child: Text(
                                          '1',
                                          style: CustomFonts.googleBodyFont(
                                              color: ConstantColors.textColor),
                                        )),
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
                                                color: ConstantColors.buttonColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: ConstantColors.buttonColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ConstantColors.buttonColor,
                                        ),
                                        child: Text(
                                          '2',
                                          style: CustomFonts.googleBodyFont(
                                              color: ConstantColors.textColor),
                                        )),
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
                                                color: ConstantColors.buttonColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                color: ConstantColors.buttonColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ConstantColors.buttonColor,
                                        ),
                                        child: Text(
                                          '3',
                                          style: CustomFonts.googleBodyFont(
                                              color: ConstantColors.textColor),
                                        )),
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
                                                color: ConstantColors.buttonColor,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                          ConstantColors.buttonColor,
                                                          ConstantColors.backgroundColor
                                                        ])),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ConstantColors.backgroundColor,
                                        ),
                                        child: Text(
                                          '4',
                                          style: CustomFonts.googleBodyFont(
                                              color: ConstantColors.textColor),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 4,
                          child: Container(
                              child: Row(children: [
                            Expanded(
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    padding:
                                        EdgeInsets.only(left: padding * 0.5),
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Login': 'تسجيل الدخول',
                                      style: CustomFonts.googleBodyFont(
                                        height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null? 1.5:1.0,
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.40),
                                    ))),
                            Expanded(
                                flex: 3,
                                child: Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(
                                        right: SizeConfig.widthMultiplier * 2),
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Choose Services': 'اختر الخدمات',
                                      style: CustomFonts.googleBodyFont(
                                        height:   App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null? 1.5:1.0,
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.40),
                                    ))),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(right: padding),
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Pick Time':'اختر وقت',
                                      style: CustomFonts.googleBodyFont(
                                        height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null? 1.5:1.0,
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.40),
                                    ))),
                            Expanded(
                                child: Container(
                                    alignment: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                    Alignment.topLeft : Alignment.topCenter,
                                    padding:
                                        EdgeInsets.only(left:
                                        App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                        padding * 0: padding * 2),
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Summary': 'ملخص',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.40),
                                    ))),
                          ])),
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
                left: padding * 2, right: padding * 2, top: padding),
            child: Container(
              height: height * 0.12,
              width: width,
              child: Text(
                App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                'Appointment Details': 'تفاصيل الموعد',
                style: CustomFonts.googleBodyFont(
                  height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null? 1.5:1.0,
                    color: ConstantColors.textColor, fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: padding * 2, right: padding * 2),
            height: height * 0.7,
            decoration: BoxDecoration(
                color: ConstantColors.buttonColor,
                borderRadius: BorderRadius.circular(padding)),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: ConstantColors.buttonColor, width: 0.5))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Time:':'زمن',
                              style: CustomFonts.googleBodyFont(
                                  color: ConstantColors.textColor),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: RichText(
                              text: TextSpan(
                                  text: '${widget.time}',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
                                  children: [
                                    TextSpan(
                                      text: '   ${widget.date}',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.textColor),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Change' : 'يتغيرون',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.8),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ConstantColors.buttonColor,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.grey, width: 0.5))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Service' : 'الخدمات',
                              style: CustomFonts.googleBodyFont(
                                  color: ConstantColors.textColor),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: RichText(
                              text: TextSpan(
                                  text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                  'Haircut Plus': 'حلاقة بلس',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
                                  children: [
                                    TextSpan(
                                      text: '',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.textColor),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Change': 'يتغيرون',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.8),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: ConstantColors.buttonColor,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: ConstantColors.buttonColor, width: 0.5))),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              'Stylist:' : 'حلاق:',
                              style: CustomFonts.googleBodyFont(
                                  color: ConstantColors.textColor),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: RichText(
                              text: TextSpan(
                                  text: widget.stylistName,
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
                                  children: [
                                    TextSpan(
                                      text: '',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Change': 'يتغيرون',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.8),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: ConstantColors.buttonColor,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: padding),
            child: Divider(
              indent: 2,
              endIndent: 2,
              color: ConstantColors.buttonColor,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       left: padding * 2, right: padding * 2, top: padding),
          //   child: Container(
          //     height: height * 0.12,
          //     width: width,
          //     child: Text(
          //       App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //       'Payment details': 'بيانات الدفع',
          //       style: CustomFonts.googleBodyFont(
          //           color: ConstantColors.textColor, fontSize: 20),
          //     ),
          //   ),
          // ),
          // Container(
          //     margin: EdgeInsets.only(left: padding * 2, right: padding * 2),
          //     height: height * 0.33,
          //     decoration: BoxDecoration(
          //         color: ConstantColors.buttonColor,
          //         borderRadius: BorderRadius.circular(padding)),
          //     child: Column(children: [
          //       Expanded(
          //           child: Container(
          //         child: Row(
          //           children: [
          //             Expanded(
          //                 flex: 2,
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: padding * 2),
          //                   child: Container(
          //                       alignment: Alignment.centerLeft,
          //                       child: Text(
          //                         App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //                         'upper payment fee' : 'رسوم الدفع العلوي',
          //                         style: CustomFonts.googleBodyFont(
          //                             color: ConstantColors.textColor.withOpacity(0.7),
          //                             fontSize: 18),
          //                       )),
          //                 )),
          //             Expanded(
          //                 child: Padding(
          //               padding: EdgeInsets.only(right: padding * 2),
          //               child: Container(
          //                 alignment: Alignment.centerRight,
          //                 child: Icon(
          //                   Icons.warning_amber_outlined,
          //                   color: ConstantColors.buttonColor.withOpacity(0.7),
          //                 ),
          //               ),
          //             )),
          //           ],
          //         ),
          //       )),
          //       Expanded(
          //           child: Container(
          //         child: Row(
          //           children: [
          //             Expanded(
          //                 flex: 2,
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: padding * 2),
          //                   child: Container(
          //                       alignment: Alignment.centerLeft,
          //                       child: Text(
          //                         App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //                         'Use in app credit' : 'استخدم في رصيد التطبيق',
          //                         style: CustomFonts.googleBodyFont(
          //                             color: ConstantColors.textColor.withOpacity(0.7),
          //                             fontSize: 18),
          //                       )),
          //                 )),
          //             Expanded(
          //                 child: Padding(
          //               padding: EdgeInsets.only(right: padding * 2),
          //               child: Container(
          //                   alignment: Alignment.centerRight,
          //                   child: Text(
          //                     App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //                     '-13 credit': '-13 رصيد',
          //                     style: CustomFonts.googleBodyFont(
          //                       color: ConstantColors.buttonColor,
          //                     ),
          //                   )),
          //             )),
          //           ],
          //         ),
          //       )),
          //     ]))
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
                      text: 'KD ${widget.price}',
                      style: CustomFonts.googleBodyFont(
                        color: ConstantColors.buttonColor,
                      ),
                      children: [
                        TextSpan(
                          text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                          '   Total' : 'مجموع   ',
                          style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: PaymentScreen(
                              accessToken: widget.accessToken,
                              idCart: widget.idCart,
                              price: widget.price,

                            )));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(padding),
                        color: ConstantColors.buttonColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                'Next' : 'التالي',
                                style: CustomFonts.googleBodyFont(
                                    color: ConstantColors.textColor),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: ConstantColors.textColor,
                                )),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
