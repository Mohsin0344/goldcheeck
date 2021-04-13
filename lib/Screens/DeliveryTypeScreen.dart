import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/CashOnDelivery.dart';
import 'package:gold/Models/CreateOrderWithCreditCard.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Screens/HomeScreen.dart';

class DeliveryTypeScreen extends StatefulWidget {
  var idCart;
  var accessToken;
  var addressID;
  var totalBill;
  DeliveryTypeScreen({
    this.totalBill,
   this.idCart,
    this.accessToken,
    this.addressID
});
  @override
  _DeliveryTypeScreenState createState() => _DeliveryTypeScreenState();
}

class _DeliveryTypeScreenState extends State<DeliveryTypeScreen> {
  TextEditingController amount = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardHolderName = TextEditingController();
  TextEditingController cardExpireMonth = TextEditingController();
  TextEditingController cardExpireYear = TextEditingController();
  TextEditingController CCV = TextEditingController();
  var _radioValue = 0;
  var padding = 8.0;

  CreateOrderWithCreditCard _createOrderWithCreditCard;
  Future<CreateOrderWithCreditCard> placeOrder({
  var cardNumber,cardHolderName,cardExpireMonth,cardExpireYear,cardCCV
}) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "order/create",
      "id_cart": widget.idCart,
      "paymentType": "creditCard",
      "id_address_delivery": widget.addressID,
      "cardNumber": cardNumber,
      "cardHolderName": cardHolderName,
      "cardExpireMonth": cardExpireMonth,
      "cardExpireYear": cardExpireYear,
      "cardCCV": cardCCV,
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
       print("${responseString.toString()}");
      return CreateOrderWithCreditCard.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }
  CashOnDelivery _cashOnDelivery;
  Future<CashOnDelivery> placeOrderOnDelivery() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "order/create",
      "id_cart": widget.idCart,
      "paymentType": "cod",
      "id_address_delivery": widget.addressID,
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      print("Cash on delivery ${responseString.toString()}");
      return CashOnDelivery.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('THIS IS ID Adddress  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ${widget.idCart}');
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Select Delivery Type',
                style: CustomFonts.googleBodyFont(
              color: Colors.white
          ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0 * 2),
              height: SizeConfig.heightMultiplier * 20,
              decoration: BoxDecoration(
                  color: Color(0xff3F4457),
                  borderRadius: BorderRadius.circular(8.0)),
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
                                  'Cash On Delivery',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white),
                                ),
                              )),
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 8, top: 8, bottom: 8),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/cash-on-delivery.png'),
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
                                  'Self Pick Up',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white),
                                ),
                              )),
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 8.0, top: 8.0, bottom: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('images/payment-method.png'),
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
            LayoutBuilder(
              builder: (context,constraints){
                if(_radioValue==1){
                  return Container(
                    padding: EdgeInsets.only(
                        left: padding, right: padding, top: padding * 2),
                    margin: EdgeInsets.only(
                        top: padding * 2, left: padding * 2, right: padding * 2),
                    height: SizeConfig.heightMultiplier * 60,
                    decoration: BoxDecoration(
                        color: Color(0xff3F4457),
                        borderRadius: BorderRadius.circular(padding)),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                              margin: EdgeInsets.only(bottom: padding),
                              child: TextField(
                                // controller: amount,
                                readOnly: true,
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.grey, height: 2.0),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '${widget.totalBill}',
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
                  );
                }else{
                  return Container();
                }
              },
            )
          ],
        ),
        bottomNavigationBar: _radioValue==1?Container(
          height: SizeConfig.heightMultiplier * 10,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: InkWell(
                    onTap: () async{
                      CreateOrderWithCreditCard createOrderWithCreditCard = await placeOrder(
                          cardNumber: cardNumber.text,
                          cardHolderName: cardHolderName.text,
                          cardExpireYear: cardExpireYear.text,
                          cardExpireMonth: cardExpireMonth.text,
                          cardCCV: CCV.text
                      );
                      setState(() {
                        _createOrderWithCreditCard = createOrderWithCreditCard;
                      });
                      if (_createOrderWithCreditCard.status == 1) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBoxxx(
                                message: "Order Placed Successfully",
                                icon: Icons.check,
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBoxxx(
                                message: _createOrderWithCreditCard.message,
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
                                  'Confirm Order',
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
        )
        :Container(
          height: SizeConfig.heightMultiplier * 10,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: InkWell(
                    onTap: () async{
                      CashOnDelivery cashOnDelivery = await placeOrderOnDelivery();
                      setState(() {
                        _cashOnDelivery = cashOnDelivery;
                      });
                      if (_cashOnDelivery.status == 1) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBoxxx(
                                message: "Order Placed Successfully",
                                icon: Icons.check,
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBoxxx(
                                message: _cashOnDelivery.message,
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
                                  'Confirm Cash on Delivery',
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
      ),
    );
  }
}
class CustomDialogBoxxx extends StatefulWidget {
  var icon;
  var message;

  CustomDialogBoxxx({this.icon, this.message});

  @override
  _CustomDialogBoxxxState createState() => _CustomDialogBoxxxState();
}

class _CustomDialogBoxxxState extends State<CustomDialogBoxxx> {
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
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomeScreen(
                    firstName: App.localStorage.getString("firstName"),
                    lastName: App.localStorage.getString("lastName"),
                    isVIP: App.localStorage.getInt("isVIP"),
                    walletCredit:
                    App.localStorage.getInt("walletCredit"),
                    accessToken: App.localStorage.getString('accessToken'),
                    email: App.localStorage.getString("email"),
                    phoneNumber: App.localStorage.getString("phoneNumber"),
                  )), (Route<dynamic> route) => false);
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