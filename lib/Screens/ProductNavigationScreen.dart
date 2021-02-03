import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/GetCartDetails.dart';
import 'package:gold/Screens/CartScreen.dart';
import 'package:gold/Screens/ProductsScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class ProductNavigationScreen extends StatefulWidget {
  var accessToken;
  var firstName;
  var lastName;
  ProductNavigationScreen({
    this.accessToken,
    this.firstName,
    this.lastName
  });
  @override
  _ProductNavigationScreenState createState() => _ProductNavigationScreenState();
}

class _ProductNavigationScreenState extends State<ProductNavigationScreen> {
  var cartLength = 0;
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;
  PageController _myPage = PageController(initialPage: 0);
  bool butVisibility1 = true;
  bool butVisibility2 = false;
  int pageIndex;
  GetCartDetails _getCartDetails;
  Future<GetCartDetails> getDetails() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "cart/getCartDetail"
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return GetCartDetails.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }
  Future<void> fetchData() async {
    GetCartDetails Details = await getDetails();

    _getCartDetails = Details;
    cartLength=_getCartDetails.data.cartProducts.length;
    return _getCartDetails;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    butVisibility1 = true;
    butVisibility2 = false;
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print("At navigation of products${widget.firstName + widget.lastName}");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 75,
            decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.1,
                      blurRadius: 8,
                      color: Color(0xff707070)
                  )
                ]
            ),
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
                              icon: Icon(Icons.shop_outlined),
                              color: butVisibility1 == true ? Color(0xff00A9A5) : Colors.white,
                              onPressed: () {
                                setState(() {
                                  _myPage.jumpToPage(0);
                                  butVisibility1 = true;
                                  butVisibility2 = false;
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
                              color: Color(0xff00A9A5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
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
                                  icon: Icon(Icons.shopping_cart),
                                  color: butVisibility2 == true ? Color(0xff00A9A5): Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _myPage.jumpToPage(1);
                                      butVisibility1 = false;
                                      butVisibility2 = true;
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
                                  color: Color(0xff00A9A5),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                      ),
                      Positioned(
                        right: 60,
                        child: FutureBuilder(
                          future: fetchData(),
                          builder: (context,snapshot){
                            if(snapshot.hasData){
                              return Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: SizeConfig.heightMultiplier * 7 ,
                                  width: SizeConfig.widthMultiplier * 7,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff00A9A5)
                                  ),
                                  child: Text(
                                    '${snapshot.data.data.cartProducts.length}',
                                    style: CustomFonts.googleBodyFont(
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else{
                              return Container();
                            }
                          },
                        )
                      )
                    ]
                  ),
                ),
              ],
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
              });

            }else if(pageIndex == 1){
              setState(() {
                butVisibility1 = false;
                butVisibility2 = true;
              });

            }
          },
          children: <Widget>[
            ProductsScreen(
                accessToken: widget.accessToken,
              cartLength: cartLength,
              firstName: widget.firstName,
              lastName : widget.lastName,
            ),
            CartScreen(
              firstName: widget.firstName,
              lastName : widget.lastName,
              context:this.context,
              accessToken: widget.accessToken,
            ),
          ],
          //physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
        ),
      ),
    );
  }
}


