import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Screens/AddCreditScreen.dart';
import 'package:gold/Screens/BookingHistoryScreen.dart';
import 'package:gold/Screens/HomeScreen.dart';
import 'package:gold/Screens/MyCreditScreen.dart';
import 'package:gold/Screens/ProductNavigationScreen.dart';
import 'package:page_transition/page_transition.dart';
import '../Constants/SizeConfig.dart';

class HomeScreenView extends StatefulWidget {
  var fullName;
  int isVIP;
  var walletCredit;
  var accessToken;
  PageController myPage;
  HomeScreenView(
      {this.fullName, this.isVIP, this.walletCredit, this.accessToken,
      this.myPage
      });

  @override
  _StateHomeScreenView createState() => _StateHomeScreenView();
}

class _StateHomeScreenView extends State<HomeScreenView> {
  var padding = 8.0;
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;

  @override
  Widget build(BuildContext context) {
    print("At home screen view ${widget.accessToken}");
    print("At home screen view ${widget.isVIP}");
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: ListView(
        children: [
          Container(
            color: Colors.black,
            margin: EdgeInsets.only(left: padding * 2, right: padding * 2),
            height: height * 0.2,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBoxx(
                              message: "hello",
                              icon: Icons.check,
                            );
                          });
                    },
                    child: Container(
                      child: Icon(
                        Icons.menu,
                        color: Color(0xff2DB7B4),
                      )
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: padding,
                      left: padding,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                          image: DecorationImage(
                              image: AssetImage('images/face.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    margin: EdgeInsets.only(right: padding * 3, top: padding * 2),
                    padding: EdgeInsets.only(left: padding * 1.5),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Text(
                                      '${widget.fullName}',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                          fontSize:
                                          SizeConfig.textMultiplier * 2.2,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Visibility(
                                    visible:
                                    widget.walletCredit > 0 ? true : false,
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(padding),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(padding),
                                            border: Border.all(
                                                color: Colors.white, width: 0.3),
                                            color: Color(0xff2DB7B4),
                                          ),
                                          child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                                          Text(
                                            'VIP',
                                            style: CustomFonts.googleBodyFont(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ):
                                          Text(
                                            'كبار الشخصيات',
                                            style: CustomFonts.googleBodyFont(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig.textMultiplier * 0.7
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: widget.walletCredit > 0
                              ? Container(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text:  TextSpan(
                                  text: 'Vip package Expires:',
                                  style: CustomFonts.googleBodyFont(
                                      color: Colors.white,
                                    fontSize: SizeConfig.textMultiplier * 1.5
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '  09 Mar 2020',
                                      style: CustomFonts.googleBodyFont(
                                        color: Color(0xff2DB7B4),
                                        letterSpacing: 1.0,
                                      ),)
                                  ]),
                            ),
                          )
                              : InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: AddCreditFromCreditCardd(
                                        accessToken: widget.accessToken,
                                      )));
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Upgrade to VIP',
                                style: CustomFonts.googleBodyFont(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
          Container(
            margin: EdgeInsets.symmetric(horizontal: padding * 2),
            height: height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(padding),
              color: Color(0xffddc654),
              // color: Colors.red
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                            child: Text(
                              'Wallet credit:',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: RichText(
                                text: TextSpan(
                                    text: '${widget.walletCredit}',
                                    style: CustomFonts.googleBodyFont(
                                        color: Color(0xff00A9A5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text: '  credit',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ]),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: AddCreditFromCreditCardd(
                                        accessToken: widget.accessToken,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                          'images/unnamed.png',
                                          width: SizeConfig.widthMultiplier * 12,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Add Credit',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: MyCreditScreen(
                                          accessToken: widget.accessToken)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                          'images/unnamed (1).png',
                                          width: SizeConfig.widthMultiplier * 12,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'My Credit',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: BookingHistoryScreen(
                                        accessToken: widget.accessToken,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                          'images/unnamed (3).png',
                                          width: SizeConfig.widthMultiplier * 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'History Haircut',
                                        style: CustomFonts.googleBodyFont(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ) : Container(
            margin: EdgeInsets.symmetric(horizontal: padding * 2),
            height: height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(padding),
              color: Color(0xffddc654),
              // color: Colors.red
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: RichText(
                                text: TextSpan(
                                    text: '${widget.walletCredit}',
                                    style: CustomFonts.googleBodyFont(
                                        color: Color(0xff00A9A5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    children: [
                                      TextSpan(
                                        text: '  ائتمان',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ]),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                            child: Text(
                              ':رصيد المحفظة',
                              style: CustomFonts.googleBodyFont(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: AddCreditFromCreditCardd(
                                        accessToken: widget.accessToken,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                          'images/unnamed (1).png',
                                          width: SizeConfig.widthMultiplier * 12,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'إضافة رصيد',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: MyCreditScreen(
                                          accessToken: widget.accessToken)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                          'images/unnamed.png',
                                          width: SizeConfig.widthMultiplier * 12,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'رصيدي',
                                        style: CustomFonts.googleBodyFont(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: BookingHistoryScreen(
                                        accessToken: widget.accessToken,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.black, width: 1))),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Image.asset(
                                          'images/unnamed (3).png',
                                          width: SizeConfig.widthMultiplier * 14,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'قصة شعر التاريخ',
                                        style: CustomFonts.googleBodyFont(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
            height: height * 0.50,
            //color: Colors.yellow,
            //margin: EdgeInsets.all(padding * 2),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (BuildContext context, index) {
                return  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                Container(
                  margin: EdgeInsets.only(left: padding * 2, top: padding * 2),
                  height: height * 0.45,
                  width: width * 0.40,
                  decoration: BoxDecoration(
                      color: Color(0xffddc654),
                      borderRadius: BorderRadius.circular(padding),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: padding,
                              bottom: padding,
                              left: padding,
                              right: padding),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '50',
                                    style: CustomFonts.googleHeaderFont(
                                        color: Color(0xff2DB7B4),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          padding:
                                          EdgeInsets.only(top: padding * 2.5),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '% OFF',
                                            style: CustomFonts.googleHeaderFont(
                                                color: Color(0xff2DB7B4),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'ANY HAIRCUT',
                                              style: CustomFonts.googleHeaderFont(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(padding),
                                bottomRight: Radius.circular(padding),
                              ),
                              color: Colors.grey),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: padding, vertical: padding),
                                  child: Text(
                                    '06-09 Mar - Only for VIP Member',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                                  child: RaisedButton(
                                    color: Color(0xff2DB7B4),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type:
                                              PageTransitionType.rightToLeft,
                                              child: ProductNavigationScreen(
                                                accessToken: widget.accessToken,
                                                firstName: widget.fullName.split(" ")[0],
                                                lastName: widget.fullName.split(" ")[1],
                                              )));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(padding * 6)),
                                    child: Text(
                                      'Book Now',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                          fontSize:
                                          SizeConfig.textMultiplier * 1.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ) :  Container(
                  margin: EdgeInsets.only(left: padding * 2, top: padding * 2),
                  height: height * 0.45,
                  width: width * 0.40,
                  decoration: BoxDecoration(
                      color: Color(0xffddc654),
                      borderRadius: BorderRadius.circular(padding),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: padding,
                              bottom: padding,
                              left: padding,
                              right: padding),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          padding:
                                          EdgeInsets.only(top: padding * 2.5,),
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            'إيقاف ٪',
                                            style: CustomFonts.googleHeaderFont(
                                                color: Color(0xff2DB7B4),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              'أي قصة شعر',
                                              style: CustomFonts.googleHeaderFont(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '۰۵',
                                    style: CustomFonts.googleHeaderFont(
                                        color: Color(0xff2DB7B4),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(padding),
                                bottomRight: Radius.circular(padding),
                              ),
                              color: Colors.grey),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                                  child: RaisedButton(
                                    color: Color(0xff2DB7B4),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type:
                                              PageTransitionType.rightToLeft,
                                              child: ProductNavigationScreen(
                                                accessToken: widget.accessToken,
                                                firstName: widget.fullName.split(" ")[0],
                                                lastName: widget.fullName.spli(" ")[1],
                                              )));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(padding * 6)),
                                    child: Text(
                                      'احجز الآن',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.white,
                                          fontSize:
                                          SizeConfig.textMultiplier * 1.5),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: padding, vertical: padding),
                                  child: Text(
                                    'فقط لأعضاءكبار الشخصيات',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white, fontSize: SizeConfig.textMultiplier * 2.2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(padding * 2),
            height: height * 0.10,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: padding * 4),
                    alignment: Alignment.centerLeft,
                    child:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                    Text(
                      'Products',
                      style: CustomFonts.googleHeaderFont(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ):
                    Text(
                      'منتجات',
                      style: CustomFonts.googleHeaderFont(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: ProductNavigationScreen(
                                accessToken: widget.accessToken,
                                firstName: widget.fullName.split(" ")[0],
                                lastName: widget.fullName.split(" ")[1],
                              )));
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                      Text(
                        'All Products',
                        style: CustomFonts.googleBodyFont(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w300),
                      ):Text(
                        'جميع المنتجات',
                        style: CustomFonts.googleBodyFont(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ProductNavigationScreen(
                            accessToken: widget.accessToken,
                            firstName: widget.fullName.split(" ")[0],
                            lastName: widget.fullName.split(" ")[1],
                          )));
                },
                child: Container(
                  padding: EdgeInsets.all(padding * 2),
                  margin: EdgeInsets.only(
                      left: padding * 2, right: padding * 2, bottom: padding),
                  height: height * 0.40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(padding),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff3D4051),
                            Color(0xff747683),
                            Color(0xffA4A5AB),
                            Color(0xffF0F0F0),
                          ]),
                      border: Border.all(color: Colors.white, width: 0.2)),
                  child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'THE',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.grey,
                                fontSize: 18,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'SUMMER VIBE',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.black,
                                fontSize: 18,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ) :
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'ال',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.grey,
                                fontSize: 18,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            'أجواء الصيف',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.black,
                                fontSize: 18,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
  bool onWillPop() {
    widget.myPage.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    return false;
  }
}
class CustomDialogBoxx extends StatefulWidget {
  var icon;
  var message;

  CustomDialogBoxx({this.icon, this.message});

  @override
  _CustomDialogBoxxState createState() => _CustomDialogBoxxState();
}

class _CustomDialogBoxxState extends State<CustomDialogBoxx> {
  var textColor_1 = Colors.white;
  var textColor_2 = Color(0xff00A9A5);
  var selectedContainer = Color(0xff00A9A5);
  var selectedContainer2 = Colors.transparent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(App.localStorage.getString("lang")== "en"){
      selectedContainer = Color(0xff00A9A5);
      textColor_1 = Colors.white;
      selectedContainer2 = Colors.transparent;
      textColor_2 = Color(0xff00A9A5);
    } else {
      selectedContainer = Colors.transparent;
      textColor_1 = Color(0xff00A9A5);
      selectedContainer2 = Color(0xff00A9A5);
      textColor_2 = Colors.white;
    }
  }
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
        padding: EdgeInsets.only(
          top: SizeConfig.heightMultiplier * 2,
          left: SizeConfig.widthMultiplier * 2,
          right: SizeConfig.widthMultiplier * 2
        ),
        height: SizeConfig.heightMultiplier * 30,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: SizeConfig.heightMultiplier * 4,
                alignment: Alignment.topCenter,
                child:Text(
                  'Select Language',
                  style: CustomFonts.googleBodyFont(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.textMultiplier * 2.5,
                    color: Color(0xff00A9A5),
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: SizeConfig.heightMultiplier * 0.2,
                color: Color(0xff00A9A5),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap:() async{
                          await App.init();
                          await App.localStorage.setString("lang", "en");
                          setState(() {
                            selectedContainer = Color(0xff00A9A5);
                            textColor_1 = Colors.white;
                            selectedContainer2 = Colors.transparent;
                            textColor_2 = Color(0xff00A9A5);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedContainer
                          ),
                          alignment: Alignment.center,
                        child: Text(
                          'English',
                          style: CustomFonts.googleBodyFont(
                            color: textColor_1,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.textMultiplier * 3,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async{
                          await App.init();
                          await App.localStorage.setString("lang", "ar");
                        setState(() {
                          selectedContainer = Colors.transparent;
                          textColor_1 = Color(0xff00A9A5);
                          selectedContainer2 = Color(0xff00A9A5);
                          textColor_2 = Colors.white;
                        });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedContainer2
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'عربى',
                            style: CustomFonts.googleBodyFont(
                                color: textColor_2,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
            Expanded(
              flex: 2,
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
                  margin: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 2
                  ),
                  width: SizeConfig.widthMultiplier * 20,
                  decoration: BoxDecoration(
                      color: Color(0xff00A9A5),
                      borderRadius: BorderRadius.circular(12)
                  ),
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




