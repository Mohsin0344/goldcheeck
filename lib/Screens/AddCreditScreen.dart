import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/AddCreditFromCreditCard.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/ConstantColors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gold/Screens/VisaCreditWeb.dart';
import 'package:gold/Screens/KnetCreditWeb.dart';

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
  final _formKey = GlobalKey<FormState>();

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
        "cardCCV": "$cardCCV",
        "lang": App.localStorage.getString("lang"),
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
      backgroundColor: ConstantColors.mainBackground,
      appBar: AppBar(
        backgroundColor: ConstantColors.mainBackground,
        title: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null? Text(
          'Add Credit From Credit Card',
          style: CustomFonts.googleBodyFont(color: ConstantColors.textColor,
          fontSize: SizeConfig.textMultiplier * 2
          ),
        ):
        Text(
          'إضافة رصيد من بطاقة الائتمان',
          style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: ConstantColors.textColor),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: padding, right: padding, top: padding * 2),
            margin: EdgeInsets.only(
                top: padding * 2, left: padding * 2, right: padding * 2),
            height: height * 0.42,
            decoration: BoxDecoration(
                color: ConstantColors.backgroundColor,
                borderRadius: BorderRadius.circular(padding)),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: padding),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some amount';
                        }
                        return null;
                      },
                      controller: amount,
                      style: CustomFonts.googleBodyFont(
                          color: ConstantColors.textColor, height: 2.0),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        'Amount': 'كمية',
                        suffixIcon: Icon(
                          Icons.attach_money,
                          color: ConstantColors.buttonColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(padding),
                            borderSide:
                                BorderSide(color: ConstantColors.buttonColor, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(padding),
                            borderSide:
                                BorderSide(color: ConstantColors.buttonColor, width: 1)),
                      ),
                    ),
                  ),
                )),
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
                          color:  ConstantColors.buttonColor,
                        ),
                      )),
                      Expanded(
                          flex: 6,
                          child: Container(
                            child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                            Text(
                              'Your Payment information is safe with '
                              'us. We use secure transmission and'
                              ' encrypted storage',
                              style: CustomFonts.googleBodyFont(
                                  color: ConstantColors.textColor),
                            ):
                            Text(
                              'معلومات الدفع الخاصة بك في أمان معنا. نحن نستخدم النقل الآمن والتخزين المشفر',
                              style: CustomFonts.googleBodyFont(
                                  color:  ConstantColors.textColor),
                            ),
                          )),
                    ],
                  ),
                )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: padding * 2,
            vertical: padding * 4
            ),
            height: height * 0.35,
            decoration: BoxDecoration(
                color: ConstantColors.backgroundColor,
                borderRadius: BorderRadius.circular(padding)),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _radioValue = 0;
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
                                  activeColor: ConstantColors.buttonColor,
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
                                  activeColor: ConstantColors.buttonColor,
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
        ],
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.heightMultiplier * 7,
        width: width,
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: InkWell(
                  onTap: () async {
                    // final AddCreditFromCreditCard addCreditFromCreditCard =
                    //     await addCreditNow(
                    //         cardCCV: CCV.text,
                    //         cardExpireMonth: cardExpireMonth.text,
                    //         cardExpireYear: cardExpireYear.text,
                    //         cardHolderName: cardHolderName.text,
                    //         cardNumber: cardNumber.text,
                    //         amount: amount.text);
                    // setState(() {
                    //   _addCreditFromCreditCard = addCreditFromCreditCard;
                    // });
                    // if (_addCreditFromCreditCard.status == 1) {
                    //   showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return CustomDialogBox(
                    //           message: "Amount Added Successfully",
                    //           icon: Icons.check,
                    //         );
                    //       });
                    // } else {
                    //   showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return CustomDialogBox(
                    //           message: _addCreditFromCreditCard.message,
                    //           icon: Icons.error_outline,
                    //         );
                    //       });
                    // }
                    if(_radioValue == 0 && _formKey.currentState.validate()){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: WebviewPaymentCredit(
                                accessToken: widget.accessToken,
                                amount: amount.text,
                              )
                          ));
                    }else if(_radioValue == 1 && _formKey.currentState.validate()){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: VisaServiceWeb(
                                accessToken: widget.accessToken,
                                amount: amount.text,
                              )
                          ));
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ConstantColors.buttonColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                              Text(
                                'Add To Wallet',
                                style: CustomFonts.googleBodyFont(
                                    color:  ConstantColors.textColor,
                                    fontSize: SizeConfig.textMultiplier * 2.2),
                              ):    Text(
                                'أضف إلى المحفظة',
                                style: CustomFonts.googleBodyFont(
                                    color:  ConstantColors.textColor,
                                    fontSize: SizeConfig.textMultiplier * 2.2),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color:  ConstantColors.textColor,
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
