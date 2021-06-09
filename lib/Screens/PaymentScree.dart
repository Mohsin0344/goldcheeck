import 'package:flutter/material.dart';
import 'package:gold/Constants/Calendar.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Screens/GreetingsScreen.dart';
import 'package:gold/Screens/VisaService.dart';
import 'package:gold/Screens/WebviewPayment.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gold/Constants/ConstantColors.dart';

class PaymentScreen extends StatefulWidget {
  var accessToken;
  var idCart;
  var price;
  PaymentScreen({
    this.accessToken,this.idCart,this.price
});
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var height = SizeConfig.heightMultiplier * 50;
  var width = SizeConfig.widthMultiplier * 100;
  var padding = CustomSizes.padding;
  var _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.idCart);
    print(widget.accessToken);
    return Scaffold(
      backgroundColor: ConstantColors.mainBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.mainBackground,
        title: Text(
          App.localStorage.getString('lang')== 'en'?'Book an appointment':
          'حجز موعد',
          style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
        ),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: ConstantColors.textColor)),
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
                                color: ConstantColors.buttonColor, width: 1))),
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
                                      'Login' : 'تسجيل الدخول',
                                      style: CustomFonts.googleBodyFont(
                                        height:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                          1.0:1.0,
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
                                        height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                          1.0:1.0,
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
                                      'Pick Time' : 'اختر وقت',
                                      style: CustomFonts.googleBodyFont(
                                          color: ConstantColors.textColor,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.40),
                                    ))),
                            Expanded(
                                child: Container(
                                    alignment:         App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                    Alignment.topRight: Alignment.topCenter,
                                    padding:
                                        EdgeInsets.only(left:          App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                        padding * 0: padding * 2),
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Summary' : 'ملخص',
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: padding * 2),
            height: height * 0.35,
            decoration: BoxDecoration(
                color: ConstantColors.buttonColor,
                borderRadius: BorderRadius.circular(padding)),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _radioValue =0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: ConstantColors.buttonColor, width: 0.5))),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Radio(
                              activeColor: ConstantColors.backgroundColor,
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue = value;
                                });
                              },
                            ),
                          )),
                          Expanded(
                              flex: 6,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Knet',
                                  style: CustomFonts.googleBodyFont(
                                      color: ConstantColors.textColor),
                                ),
                              )),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(
                                right: padding, top: padding, bottom: padding),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/knet.png'),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _radioValue = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: ConstantColors.buttonColor, width: 0.5))),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            child: Radio(
                              activeColor: ConstantColors.backgroundColor,
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue = value;
                                });
                              },
                            ),
                          )),
                          Expanded(
                              flex: 6,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                  'VISA' : 'الدفع عن طريق البطاقة',
                                  style: CustomFonts.googleBodyFont(
                                    height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      0.0:1.0,
                                      color: ConstantColors.textColor),
                                ),
                              )),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(
                                right: padding, top: padding, bottom: padding),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/visa.png'),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                          // Expanded(
                          //     child: Padding(
                          //   padding: EdgeInsets.only(
                          //       right: padding, top: padding, bottom: padding),
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     decoration: BoxDecoration(
                          //         image: DecorationImage(
                          //             image: AssetImage('images/knet.png'),
                          //             fit: BoxFit.cover)),
                          //   ),
                          // )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: EdgeInsets.only(
          //       left: padding, right: padding, top: padding * 2),
          //   margin: EdgeInsets.only(
          //       top: padding * 2, left: padding * 2, right: padding * 2),
          //   height: height * 0.80,
          //   decoration: BoxDecoration(
          //       color: Color(0xff3F4457),
          //       borderRadius: BorderRadius.circular(padding)),
          //   child: Column(
          //     children: [
          //       Expanded(
          //           child: Container(
          //         margin: EdgeInsets.only(bottom: padding),
          //         child: TextField(
          //           style: CustomFonts.googleBodyFont(
          //               color: Colors.grey, height: 2.0),
          //           keyboardType: TextInputType.number,
          //           decoration: InputDecoration(
          //             filled: true,
          //             fillColor: Colors.white,
          //             hintText: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //             'Card Number' : 'رقم البطاقة',
          //             suffixIcon: Icon(
          //               Icons.credit_card,
          //               color: Colors.grey,
          //             ),
          //             enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(padding),
          //                 borderSide:
          //                     BorderSide(color: Colors.white, width: 1)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(padding),
          //                 borderSide:
          //                     BorderSide(color: Colors.green, width: 1)),
          //           ),
          //         ),
          //       )),
          //       Expanded(
          //           child: Container(
          //         margin: EdgeInsets.only(bottom: padding),
          //         child: TextField(
          //           style: CustomFonts.googleBodyFont(
          //               color: Colors.grey, height: 2.0),
          //           decoration: InputDecoration(
          //             filled: true,
          //             fillColor: Colors.white,
          //             hintText: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //             'Card Name' : 'اسم البطاقة',
          //             suffixIcon: Icon(
          //               Icons.account_box,
          //               color: Colors.grey,
          //             ),
          //             enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(padding),
          //                 borderSide:
          //                     BorderSide(color: Colors.white, width: 1)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(padding),
          //                 borderSide:
          //                     BorderSide(color: Colors.green, width: 1)),
          //           ),
          //         ),
          //       )),
          //       Expanded(
          //           child: Container(
          //         margin: EdgeInsets.only(
          //           bottom: padding,
          //         ),
          //         child: Row(children: [
          //           // Expanded(
          //           //   child: Container(
          //           //     child: TextField(
          //           //       style: CustomFonts.googleBodyFont(
          //           //           color: Colors.grey,
          //           //           height: 2.0
          //           //       ),
          //           //       keyboardType: TextInputType.number,
          //           //       decoration: InputDecoration(
          //           //         filled: true,
          //           //         fillColor: Colors.white,
          //           //         hintText: 'Exp. Date',
          //           //         suffixIcon: Icon(
          //           //           Icons.calendar_today_outlined,
          //           //           color: Colors.grey,
          //           //         ),
          //           //         enabledBorder: OutlineInputBorder(
          //           //             borderRadius: BorderRadius.circular(padding),
          //           //             borderSide: BorderSide(
          //           //                 color: Colors.white,
          //           //                 width: 1
          //           //             )
          //           //         ),
          //           //         focusedBorder: OutlineInputBorder(
          //           //             borderRadius: BorderRadius.circular(padding),
          //           //             borderSide: BorderSide(
          //           //                 color: Colors.green,
          //           //                 width: 1
          //           //             )
          //           //         ),
          //           //       ),
          //           //     ),
          //           //   ),
          //           // ),
          //           Expanded(
          //               child: Container(
          //             child: MyTextFieldDatePicker(
          //               labelText: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //               "Date" : 'تاريخ',
          //               prefixIcon: Icon(Icons.date_range, color: Colors.grey),
          //               suffixIcon:
          //                   Icon(Icons.arrow_drop_down, color: Colors.grey),
          //               lastDate: DateTime.now().add(Duration(days: 366)),
          //               firstDate: DateTime.now(),
          //               initialDate: DateTime.now().add(Duration(days: 1)),
          //               onDateChanged: (selectedDate) {
          //                 // Do something with the selected date
          //               },
          //             ),
          //           )),
          //           Expanded(
          //             child: Container(
          //               alignment: Alignment.centerRight,
          //               margin: EdgeInsets.only(left: padding),
          //               child: TextField(
          //                 style: CustomFonts.googleBodyFont(
          //                     color: Colors.grey, height: 2.0),
          //                 keyboardType: TextInputType.number,
          //                 decoration: InputDecoration(
          //                   filled: true,
          //                   fillColor: Colors.white,
          //                   hintText: 'CCV',
          //                   suffixIcon: Icon(
          //                     Icons.lock,
          //                     color: Colors.grey,
          //                   ),
          //                   enabledBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(padding),
          //                       borderSide:
          //                           BorderSide(color: Colors.white, width: 1)),
          //                   focusedBorder: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(padding),
          //                       borderSide:
          //                           BorderSide(color: Colors.green, width: 1)),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ]),
          //       )),
          //       Expanded(
          //           child: Container(
          //         margin: EdgeInsets.only(bottom: padding),
          //         child: Row(
          //           children: [
          //             Expanded(
          //                 child: Container(
          //               alignment: Alignment.centerLeft,
          //               child: Icon(
          //                 Icons.lock,
          //                 color: Colors.grey,
          //               ),
          //             )),
          //             Expanded(
          //                 flex: 6,
          //                 child: Container(
          //                   child: Text(
          //                     App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //                     'Your Payment information is safe with '
          //                     'us. We use ssecure transmission and'
          //                     'encrypted storage' :
          //                     'معلومات الدفع الخاصة بك في أمان معنا. نحن نستخدم النقل الآمن والتخزين المشفر',
          //                     style: CustomFonts.googleBodyFont(
          //                       height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          //                         1.1:1.0,
          //                         color: Colors.grey),
          //                   ),
          //                 )),
          //           ],
          //         ),
          //       )),
          //     ],
          //   ),
          // ),
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
                      text: ' KD ${widget.price}',
                      style: CustomFonts.googleBodyFont(
                        color: ConstantColors.textColor,
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
                   if(_radioValue == 0){
                     Navigator.push(
                         context,
                         PageTransition(
                             type: PageTransitionType.rightToLeft,
                             child: WebviewPayment(
                               idCart: widget.idCart,
                               accessToken: widget.accessToken,
                             )));
                   }else if(_radioValue == 1){
                     Navigator.push(
                         context,
                         PageTransition(
                             type: PageTransitionType.rightToLeft,
                             child: VisaService(
                               idCart: widget.idCart,
                               accessToken: widget.accessToken,
                             )));
                   }
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
                                  color: ConstantColors.buttonColor,
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
