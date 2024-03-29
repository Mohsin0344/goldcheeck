import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Screens/HomeScreenView.dart';
import 'package:gold/Screens/LocatioScreen.dart';
import 'package:gold/Screens/ProfileScreen.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';
import 'AppointmentScreen.dart';
import 'CartScreen.dart';
import 'package:gold/Constants/ConstantColors.dart';
import 'package:gold/Screens/test.dart';

class HomeScreen extends StatefulWidget {
  var firstName;
  var lastName;
  int isVIP;
  var walletCredit;
  var accessToken;
  var email;
  var phoneNumber;
  HomeScreen({
    this.firstName,
    this.lastName,
    this.isVIP,
    this.walletCredit,
    this.accessToken,
    this.email,
    this.phoneNumber
  });
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;
  PageController _myPage = PageController(initialPage: 0);
  bool butVisibility1 = true;
  bool butVisibility2 = false;
  bool butVisibility3 = false;
  bool butVisibility4 = false;
  int pageIndex;

  void initState(){
     butVisibility1 = true;
     butVisibility2 = false;
     butVisibility3 = false;
     butVisibility4 = false;
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ConstantColors.mainBackground,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          child: BottomAppBar(
            color: ConstantColors.backgroundColor,
            shape: CircularNotchedRectangle(),
            notchMargin: 0,
            child: Container(
              height: 75,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(
                        padding * 1.5
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Container(
                              child: IconButton(
                                iconSize: 30.0,
                                icon: Icon(Icons.home),
                                color: butVisibility1 == true ? ConstantColors.buttonColor : Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _myPage.jumpToPage(0);
                                    butVisibility1 = true;
                                    butVisibility2 = false;
                                    butVisibility3 = false;
                                    butVisibility4 = false;
                                  });
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: butVisibility1 == true ? true : false,
                            child: Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: padding * 2
                                ),
                                color: ConstantColors.buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(
                          padding * 1.5
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Container(
                              child: IconButton(
                                iconSize: 30.0,
                                icon: Icon(Icons.location_on),
                                color: butVisibility2 == true ? ConstantColors.buttonColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _myPage.jumpToPage(1);
                                    butVisibility1 = false;
                                    butVisibility2 = true;
                                    butVisibility3 = false;
                                    butVisibility4 = false;
                                  });
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: butVisibility2 == true ? true : false,
                            child: Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: padding * 2
                                ),
                                color: ConstantColors.buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(
                          padding * 1.5
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Container(
                              child: IconButton(
                                iconSize: 30.0,
                                icon: Icon(Icons.shopping_cart_rounded),
                                color: butVisibility3 == true ? ConstantColors.buttonColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _myPage.jumpToPage(2);
                                    butVisibility1 = false;
                                    butVisibility2 = false;
                                    butVisibility3 = true;
                                    butVisibility4 = false;
                                  });
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: butVisibility3 == true ? true : false,
                            child: Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: padding * 2
                                ),
                                color: ConstantColors.buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(
                          padding * 1.5
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Container(
                              child: IconButton(
                                iconSize: 30.0,
                                icon: Icon(Icons.account_box),
                                color: butVisibility4 == true ? ConstantColors.buttonColor: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    _myPage.jumpToPage(3);
                                    butVisibility1 = false;
                                    butVisibility2 = false;
                                    butVisibility3 = false;
                                    butVisibility4 = true;
                                  });
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: butVisibility4 == true ? true : false,
                            child: Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: padding * 2
                                ),
                                color: ConstantColors.buttonColor,
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
          ),
        ),
        body: PageView(
          controller: _myPage,
          onPageChanged: (pageIndex) {
            print('Page Changes to index $pageIndex');
            if(pageIndex == 0){
              setState(() {
                butVisibility1 = true;
                butVisibility2 = false;
                butVisibility3 = false;
                butVisibility4 = false;
              });

            }else if(pageIndex == 1){
              setState(() {
                butVisibility1 = false;
                butVisibility2 = true;
                butVisibility3 = false;
                butVisibility4 = false;
              });

            } else if(pageIndex == 2){
              setState(() {
                butVisibility1 = false;
                butVisibility2 = false;
                butVisibility3 = true;
                butVisibility4 = false;
              });

            }else{
              setState(() {
                butVisibility1 = false;
                butVisibility2 = false;
                butVisibility3 = false;
                butVisibility4 = true;
              });
            }
          },
          children: <Widget>[
            HomeScreenView(
              fullName: widget.firstName+" "+ widget.lastName,
              isVIP: widget.isVIP,
              walletCredit: widget.walletCredit,
              accessToken: widget.accessToken,
              myPage: _myPage,
            ),
            Testing(
              mypage: _myPage
            ),
            CartScreen(
              firstName: widget.firstName,
              lastName : widget.lastName,
              context:this.context,
              accessToken: widget.accessToken,
              myPage: _myPage,
              arrowValue: "0",
            ),
            ProfileScreen(
              accessToken: widget.accessToken,
              firstName: widget.firstName,
              lastName: widget.lastName,
              email: widget.email,
              phoneNumber: widget.phoneNumber,
              myPage: _myPage,
            ),
          ],
          physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
        ),
        floatingActionButton: InkWell(
          onTap: (){
                  Navigator.push(context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: AppointmentScreen(
                            accessToken: widget.accessToken,
                          )));
          },
          child: Container(
            margin: EdgeInsets.only(
              bottom: SizeConfig.heightMultiplier * 2
            ),
            height: 65.0,
            width: 65.0,
            decoration: BoxDecoration(
              color: ConstantColors.buttonColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: ConstantColors.backgroundColor,
                width: 3
              )
            ),
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                ),
          ),
        ),
        extendBody: true,
      ),
    );
  }
}

// onPressed: () {
// setState(() {
// _myPage.jumpToPage(0);
// });
// // },

