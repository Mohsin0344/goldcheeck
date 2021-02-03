import 'package:flutter/material.dart';
import 'package:gold/Constants/Calendar.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/AddCreditFromCreditCard.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:gold/Screens/GreetingsScreen.dart';

import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:month_picker_dialog/month_picker_dialog.dart';

class AddCreditFromCreditCardd extends StatefulWidget {
  var accessToken;

  AddCreditFromCreditCardd({this.accessToken});

  @override
  _AddCreditFromCreditCarddState createState() =>
      _AddCreditFromCreditCarddState();
}

class _AddCreditFromCreditCarddState extends State<AddCreditFromCreditCardd> {
  TextEditingController amount = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardHolderName = TextEditingController();
  TextEditingController cardExpireMonth = TextEditingController();
  TextEditingController cardExpireYear = TextEditingController();
  TextEditingController CCV = TextEditingController();
  var height = SizeConfig.heightMultiplier * 50;
  var width = SizeConfig.widthMultiplier * 100;
  var padding = CustomSizes.padding;
  var _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    AddCreditFromCreditCard _addCreditFromCreditCard;
    Future<AddCreditFromCreditCard> addCreditNow(
        {String amount,
        cardNumber,
        cardHolderName,
        cardExpireMonth,
        cardExpireYear,
        cardCCV}) async {
      final String url = "http://15.185.204.189/webapi/server.php";
      final response = await http.post(url, headers: {
        "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
      }, body: {
        "accessToken": "${widget.accessToken}",
        "action": "transactions/addCreditFromCreditCard",
        "amount": "$amount",
        "cardNumber": "$cardNumber",
        "cardHolderName": "$cardHolderName",
        "cardExpireMonth": "$cardExpireMonth",
        "cardExpireYear": "$cardExpireYear",
        "cardCCV": "$cardCCV"
      });
      if (response.statusCode == 200) {
        final String responseString = response.body;
        print(responseString.toString());
        return AddCreditFromCreditCard.fromRawJson(responseString);
      } else {
        print(response.statusCode);
      }
    }

    return Material(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Add Credit From Credit Card',
            style: CustomFonts.googleBodyFont(color: Colors.white),
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: padding, right: padding, top: padding * 2),
            margin: EdgeInsets.only(
                top: padding * 2, left: padding * 2, right: padding * 2),
            height: height * 1.2,
            decoration: BoxDecoration(
                color: Color(0xff3F4457),
                borderRadius: BorderRadius.circular(padding)),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: padding),
                  child: TextField(
                    controller: amount,
                    style: CustomFonts.googleBodyFont(
                        color: Colors.grey, height: 2.0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Amount',
                      suffixIcon: Icon(
                        Icons.attach_money,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: padding),
                  child: TextField(
                    controller: cardNumber,
                    style: CustomFonts.googleBodyFont(
                        color: Colors.grey, height: 2.0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Card Number',
                      suffixIcon: Icon(
                        Icons.credit_card,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: padding),
                  child: TextField(
                    controller: cardHolderName,
                    style: CustomFonts.googleBodyFont(
                        color: Colors.grey, height: 2.0),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Card Name',
                      suffixIcon: Icon(
                        Icons.account_box,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                    bottom: padding,
                  ),
                  child: Row(children: [
                    // Expanded(
                    //   child: Container(
                    //     child: TextField(
                    //       style: CustomFonts.googleBodyFont(
                    //           color: Colors.grey,
                    //           height: 2.0
                    //       ),
                    //       keyboardType: TextInputType.number,
                    //       decoration: InputDecoration(
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         hintText: 'Exp. Date',
                    //         suffixIcon: Icon(
                    //           Icons.calendar_today_outlined,
                    //           color: Colors.grey,
                    //         ),
                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(padding),
                    //             borderSide: BorderSide(
                    //                 color: Colors.white,
                    //                 width: 1
                    //             )
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(padding),
                    //             borderSide: BorderSide(
                    //                 color: Colors.green,
                    //                 width: 1
                    //             )
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                        child: Container(
                            child: TextField(
                      controller: cardExpireMonth,
                      style: CustomFonts.googleBodyFont(
                          color: Colors.grey, height: 2.0),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'MM',
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(padding),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(padding),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                      ),
                    ))),
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(left: padding),
                          child: TextField(
                            controller: cardExpireYear,
                            style: CustomFonts.googleBodyFont(
                                color: Colors.grey, height: 2.0),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'YY',
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(padding),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(padding),
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 1)),
                            ),
                          )),
                    ),
                  ]),
                )),
                Expanded(
                  child: Container(
                      // margin: EdgeInsets.only(
                      //     left: padding
                      // ),
                      child: TextField(
                    controller: CCV,
                    style: CustomFonts.googleBodyFont(
                        color: Colors.grey, height: 2.0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'CVV',
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(padding),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                    ),
                  )),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: padding),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                      )),
                      Expanded(
                          flex: 6,
                          child: Container(
                            child: Text(
                              'Your Payment information is safe with '
                              'us. We use ssecure transmission and'
                              'encrypted storage',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.grey),
                            ),
                          )),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.18,
        width: width,
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: InkWell(
                  onTap: () async {
                    final AddCreditFromCreditCard addCreditFromCreditCard =
                        await addCreditNow(
                            cardCCV: CCV.text,
                            cardExpireMonth: cardExpireMonth.text,
                            cardExpireYear: cardExpireYear.text,
                            cardHolderName: cardHolderName.text,
                            cardNumber: cardNumber.text,
                            amount: amount.text);
                    setState(() {
                      _addCreditFromCreditCard = addCreditFromCreditCard;
                    });
                    if (_addCreditFromCreditCard.status == 1) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              message: "Amount Added Successfully",
                              icon: Icons.check,
                            );
                          });
                      // Navigator.push(context,
                      //     PageTransition(
                      //         type: PageTransitionType.rightToLeft,
                      //         child:
                      //     ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              message: _addCreditFromCreditCard.message,
                              icon: Icons.error_outline,
                            );
                          });
                    }
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
                                'Add To Wallet',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white,
                                    fontSize: SizeConfig.textMultiplier * 2.5),
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
    ));
  }
}
