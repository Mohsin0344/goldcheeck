import 'package:flutter/material.dart';
import 'package:gold/Constants/Calendar.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Screens/GreetingsScreen.dart';
import 'package:gold/Screens/WebviewPayment.dart';
import 'package:page_transition/page_transition.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Book an appointment',
            style: CustomFonts.googleBodyFont(color: Colors.white),
          ),
        ),
        leading: Icon(Icons.arrow_back, color: Colors.white),
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
                                color: Color(0xff3B3F52), width: 1))),
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
                                              color: Colors.white),
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
                                      )),
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
                                              color: Colors.white),
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
                                      )),
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
                                              color: Colors.white),
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
                                                color: Color(0xff3B3F52),
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
                                                          Color(0xff1D747B),
                                                          Color(0xff3ABCB8)
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
                                          color: Color(0xff00A9A5),
                                        ),
                                        child: Text(
                                          '4',
                                          style: CustomFonts.googleBodyFont(
                                              color: Colors.white),
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
                                          color: Colors.grey,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.65),
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
                                          color: Colors.grey,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.65),
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
                                          color: Colors.grey,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.65),
                                    ))),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    padding:
                                        EdgeInsets.only(right: padding * 0),
                                    child: Text(
                                      App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                      'Summary' : 'ملخص',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.textMultiplier * 1.65),
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
                color: Color(0xff3F4457),
                borderRadius: BorderRadius.circular(padding)),
            child: Column(
              children: [
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
                          child: Radio(
                            activeColor: Color(0xff00A9A5),
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
                                    color: Colors.white),
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
                          child: Radio(
                            activeColor: Color(0xff00A9A5),
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
                                'Pay By Card' : 'الدفع عن طريق البطاقة',
                                style: CustomFonts.googleBodyFont(
                                  height: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                    0.0:1.0,
                                    color: Colors.white),
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
                      text: ' \$${widget.price}',
                      style: CustomFonts.googleBodyFont(
                        color: Color(0xff00A9A5),
                      ),
                      children: [
                        TextSpan(
                          text: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                          '   Total' : 'مجموع   ',
                          style: CustomFonts.googleBodyFont(color: Colors.grey),
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
                            child: WebviewPayment(
                              idCart: widget.idCart,
                              accessToken: widget.accessToken,
                            )));
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
                                App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                'Next' : 'التالي',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
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
