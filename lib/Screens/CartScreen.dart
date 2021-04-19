import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/GetCartDetails.dart';
import 'package:gold/Screens/AddressScreen.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Models/RemoveProduct.dart';

class CartScreen extends StatefulWidget {
  var firstName;
  var lastName;
  var accessToken;
  var context;
  var arrowValue;
  PageController myPage;
  CartScreen({this.accessToken, this.context, this.firstName, this.lastName,
 this.myPage,this.arrowValue
  });

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  RemoveProduct _removeProduct;
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

  GetCartDetails _getCartDetails;
  Future<GetCartDetails> getDetails() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "cart/getCartDetail",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return GetCartDetails.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  Future<RemoveProduct> removeProduct({var idProduct, var idCart}) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "cart/removeProductFromCart",
      'id_product': '$idProduct',
      'id_cart' : '$idCart'
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return RemoveProduct.fromRawJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> fetchData() async {
    GetCartDetails Details = await getDetails();

    _getCartDetails = Details;
    return _getCartDetails;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "AT Cart Screen 00000000000000000000000000000000000000000000000000000${widget.accessToken}");
   return WillPopScope(
     onWillPop: () => Future.sync(onWillPop),
     child: Scaffold(
       backgroundColor: Colors.black,
       body: ListView(
         //physics: NeverScrollableScrollPhysics(),
         children: [
           Container(
             alignment: Alignment.center,
             height: height * 0.25,
             child:  Row(
               children: [
                 Expanded(
                   flex: 2,
                   child: InkWell(
                     onTap: ()=> Navigator.pop(context),
                     child: Visibility(
                       visible: widget.arrowValue == "1"? true:false,
                       child: Container(
                         margin: EdgeInsets.only(
                           left: SizeConfig.widthMultiplier
                         ),
                         alignment: Alignment.centerLeft,
                         child: Icon(
                           Icons.arrow_back,
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ),
                 ),
                 Expanded(
                   flex: 3,
                   child: Container(
                     child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                     Text(
                       'Cart',
                       style: CustomFonts.googleHeaderFont(
                           color: Colors.white,
                           fontSize: 30,
                           fontWeight: FontWeight.bold),
                       textAlign: TextAlign.left,
                     ):
                     Text(
                       'عربة التسوق',
                       style: CustomFonts.googleHeaderFont(
                           color: Colors.white,
                           fontSize: 30,
                           fontWeight: FontWeight.bold),
                     ),
                   )
                 )
               ],
             )
           ),
           FutureBuilder(
             future: fetchData(),
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 return Container(
                   padding: EdgeInsets.only(left: padding * 2),
                   margin: EdgeInsets.only(right: padding * 6),
                   child: RichText(
                     text:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                     TextSpan(
                         text: '${snapshot.data.data.cartProducts.length}',
                         style: CustomFonts.googleHeaderFont(
                             color: Colors.white,
                             fontSize: 30,
                             fontWeight: FontWeight.w300),
                         children: [
                           TextSpan(
                             text: ' Items into your Cart',
                             style: CustomFonts.googleHeaderFont(
                                 color: Colors.white,
                                 fontSize: 28,
                                 fontWeight: FontWeight.w300),
                           )
                         ]) :TextSpan(
                         text: "العناصر في عربة التسوق الخاصة بك  ",
                         style: CustomFonts.googleHeaderFont(
                             color: Colors.white,
                             fontSize: SizeConfig.textMultiplier * 2.5,
                             fontWeight: FontWeight.w300),
                         children: [
                           TextSpan(
                             text: '${snapshot.data.data.cartProducts.length}',
                             style: CustomFonts.googleHeaderFont(
                                 color: Colors.white,
                                 fontSize: 28,
                                 fontWeight: FontWeight.w300),
                           )
                         ]),
                   ),
                 );
               } else {
                 return
                   App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                   Container(
                   padding: EdgeInsets.only(left: padding * 2),
                   margin: EdgeInsets.only(right: padding * 6),
                   child: RichText(
                     text: TextSpan(
                         text: '0',
                         style: CustomFonts.googleHeaderFont(
                             color: Colors.white,
                             fontSize: 30,
                             fontWeight: FontWeight.w300),
                         children: [
                           TextSpan(
                             text: ' Items into your Cart',
                             style: CustomFonts.googleHeaderFont(
                                 color: Colors.white,
                                 fontSize: 28,
                                 fontWeight: FontWeight.w300),
                           )
                         ]),
                   ),
                 ):
                   Container(
                     padding: EdgeInsets.only(left: padding * 2),
                     margin: EdgeInsets.only(right: padding * 6),
                     child: RichText(
                       text:  App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                       TextSpan(
                           text: '${snapshot.data.data.cartProducts.length}',
                           style: CustomFonts.googleHeaderFont(
                               color: Colors.white,
                               fontSize: 30,
                               fontWeight: FontWeight.w300),
                           children: [
                             TextSpan(
                               text: ' Items into your Cart',
                               style: CustomFonts.googleHeaderFont(
                                   color: Colors.white,
                                   fontSize: 28,
                                   fontWeight: FontWeight.w300),
                             )
                           ]) :TextSpan(
                           text: "العناصر في عربة التسوق الخاصة بك  ",
                           style: CustomFonts.googleHeaderFont(
                               color: Colors.white,
                               fontSize: SizeConfig.textMultiplier * 2.5,
                               fontWeight: FontWeight.w300),
                           children: [
                             TextSpan(
                               text: '0',
                               style: CustomFonts.googleHeaderFont(
                                   color: Colors.white,
                                   fontSize: 28,
                                   fontWeight: FontWeight.w300),
                             )
                           ]),
                     ),
                   );
               }
             },
           ),
           FutureBuilder(
             future: fetchData(),
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 return ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   itemCount: snapshot.data.data.cartProducts.length,
                   shrinkWrap: true,
                   itemBuilder: (BuildContext context, index) {
                     return Container(
                       margin: EdgeInsets.only(top: padding),
                       padding: EdgeInsets.symmetric(vertical: padding),
                       decoration: BoxDecoration(
                         border: Border(
                             bottom: BorderSide(color: Colors.white, width: 0.1),
                             top: BorderSide(color: Colors.white, width: 0.1)),
                       ),
                       height: height * 0.25,
                       child: Row(
                         children: [
                           Expanded(
                             child: Padding(
                               padding:
                               EdgeInsets.symmetric(horizontal: padding),
                               child: Container(
                                 decoration: BoxDecoration(
                                   color: Colors.yellow.withOpacity(0.8),
                                   borderRadius: BorderRadius.circular(padding),
                                   // image: DecorationImage(
                                   //     image: AssetImage('images/face.jpg'),
                                   //     fit: BoxFit.cover
                                   // )
                                 ),
                                 child: Image.network(
                                   snapshot
                                       .data.data.cartProducts[index].photoUrl,
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ),
                           ),
                           Expanded(
                             flex: 3,
                             child: Container(
                               margin: EdgeInsets.only(left: padding),
                               child: Column(
                                 children: [
                                   Expanded(
                                     child: Container(
                                         alignment: Alignment.topLeft,
                                         child: Row(
                                           children: [
                                             Expanded(
                                               flex: 4,
                                               child: Container(
                                                 child: Text(
                                                   '${snapshot.data.data.cartProducts[index].name}',
                                                   style: CustomFonts
                                                       .googleHeaderFont(
                                                       color: Colors.white,
                                                       fontSize: 24,
                                                       fontWeight:
                                                       FontWeight.w300),
                                                 ),
                                               ),
                                             ),
                                             Expanded(
                                               child: InkWell(
                                                 onTap: () async{
                                                   print(_getCartDetails.data.cartProducts[index].idProduct);
                                                   final RemoveProduct remooveProduct = await removeProduct(idCart: _getCartDetails.data.idCart,
                                                     idProduct: _getCartDetails.data.cartProducts[index].idProduct
                                                   );
                                                   setState(() {
                                                     _removeProduct = remooveProduct;
                                                   });
                                                   if (_removeProduct.status == 1) {
                                                     print(
                                                         'Product addded to cart successfuly aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                                                     CartScreen(accessToken: widget.accessToken);
                                                     showDialog(
                                                         context: context,
                                                         builder: (BuildContext context) {
                                                           return CustomDialogBox(
                                                             message: "Product removed",
                                                             icon: Icons.check,
                                                           );
                                                         });
                                                     // Navigator.push(context,
                                                     //     PageTransition(
                                                     //         type: PageTransitionType.rightToLeft,
                                                     //         child: CartScreen(accessToken: widget.accessToken)));
                                                   } else {
                                                     showDialog(
                                                         context: context,
                                                         builder: (BuildContext context) {
                                                           return CustomDialogBox(
                                                             message: _removeProduct.message,
                                                             icon: Icons.error_outline,
                                                           );
                                                         });
                                                   }
                                                 },
                                                 child: Container(
                                                     child: Icon(
                                                       Icons.close,
                                                       color: Colors.white,
                                                     )),
                                               ),
                                             ),
                                           ],
                                         )),
                                   ),
                                   Expanded(
                                     child: Container(
                                         alignment: Alignment.bottomLeft,
                                         child: RichText(
                                           text: TextSpan(
                                               text: 'Quantity:',
                                               style:
                                               CustomFonts.googleHeaderFont(
                                                   color: Colors.white,
                                                   fontSize: 16,
                                                   fontWeight:
                                                   FontWeight.w300),
                                               children: [
                                                 TextSpan(
                                                   text:
                                                   ' ${snapshot.data.data.cartProducts[index].quantity}',
                                                   style: CustomFonts
                                                       .googleHeaderFont(
                                                       color: Colors.white,
                                                       fontSize: 16,
                                                       fontWeight:
                                                       FontWeight.w300),
                                                 )
                                               ]),
                                         )),
                                   ),
                                   Expanded(
                                     child: Container(
                                       child: Row(
                                         children: [
                                           Expanded(
                                             flex: 6,
                                             child: Container(
                                                 alignment: Alignment.topLeft,
                                                 child: RichText(
                                                   text: TextSpan(
                                                       text: 'Color:',
                                                       style: CustomFonts
                                                           .googleHeaderFont(
                                                           color:
                                                           Colors.white,
                                                           fontSize: 16,
                                                           fontWeight:
                                                           FontWeight
                                                               .w300),
                                                       children: [
                                                         TextSpan(
                                                           text: ' Black',
                                                           style: CustomFonts
                                                               .googleHeaderFont(
                                                               color: Colors
                                                                   .white,
                                                               fontSize: 16,
                                                               fontWeight:
                                                               FontWeight
                                                                   .w300),
                                                         )
                                                       ]),
                                                 )),
                                           ),
                                           Expanded(
                                             flex: 2,
                                             child: Container(
                                               child: Text(
                                                 "\$ ${(snapshot.data.data.cartProducts[index].price) * snapshot.data.data.cartProducts[index].quantity}",
                                                 style: CustomFonts
                                                     .googleHeaderFont(
                                                     color: Colors.yellow
                                                         .withOpacity(0.8),
                                                     fontSize: 16,
                                                     fontWeight:
                                                     FontWeight.w300),
                                                 textAlign: TextAlign.right,
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
                         ],
                       ),
                     );
                   },
                 );
               } else {
                 return Center(
                     child: Container(
                       color: Colors.black,
                     ));
               }
             },
           ),
           FutureBuilder(
             future: fetchData(),
             builder: (context, snapshot) {
               if (snapshot.hasData) {
                 double totalBill = 0.0;
                 var totalList =
                 new List(_getCartDetails.data.cartProducts.length);
                 for (int i = 0; i < totalList.length; i++) {
                   totalList[i] = (_getCartDetails.data.cartProducts[i].price) *
                       (_getCartDetails.data.cartProducts[i].quantity);
                 }
                 for (int i = 0; i < totalList.length; i++) {
                   totalBill = totalBill + totalList[i];
                 }
                 print(totalBill);
                 return ListView.builder(
                   shrinkWrap: true,
                   itemCount: 1,
                   itemBuilder: (BuildContext context, index) {
                     return Visibility(
                       visible: _getCartDetails.data.cartProducts.length > 0
                           ? true
                           : false,
                       child: Padding(
                         padding: EdgeInsets.symmetric(
                             horizontal: SizeConfig.widthMultiplier * 2),
                         child: Container(
                           margin: EdgeInsets.only(
                             top: SizeConfig.heightMultiplier * 2,
                           ),
                           height: SizeConfig.heightMultiplier * 4,
                           child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                           Row(
                             children: [
                               Expanded(
                                 child: Container(
                                     child: Text(
                                       'Total',
                                       style: CustomFonts.googleBodyFont(
                                           color: Colors.white,
                                           fontSize: SizeConfig.textMultiplier * 3),
                                     )),
                               ),
                               Expanded(
                                   child: Container(
                                       alignment: Alignment.centerRight,
                                       child: Text(
                                         '\$ $totalBill',
                                         style: CustomFonts.googleBodyFont(
                                             color:
                                             Colors.yellow.withOpacity(0.8),
                                             fontSize:
                                             SizeConfig.textMultiplier * 3),
                                       )))
                             ],
                           ): Row(
                             children: [
                               Expanded(
                                   child: Container(
                                       alignment: Alignment.centerLeft,
                                       child: Text(
                                         '\$ $totalBill',
                                         style: CustomFonts.googleBodyFont(
                                             color:
                                             Colors.yellow.withOpacity(0.8),
                                             fontSize:
                                             SizeConfig.textMultiplier * 3),
                                       ))),
                               Expanded(
                                 child: Container(
                                   alignment: Alignment.centerRight,
                                     child: Text(
                                       'مجموع',
                                       style: CustomFonts.googleBodyFont(
                                           color: Colors.white,
                                           fontSize: SizeConfig.textMultiplier * 3),
                                     )),
                               ),
                             ],
                           ),
                         ),
                       ),
                     );
                   },
                 );
               } else {
                 return Container(color: Colors.black);
               }
             },
           ),
           InkWell(
               onTap: () {
                 Navigator.push(
                     context,
                     PageTransition(
                         type: PageTransitionType.rightToLeft,
                         child: AddressScreen(
                             firstName: widget.firstName,
                             lastName: widget.lastName,
                             accessToken: widget.accessToken,
                             idCart: _getCartDetails.data.idCart,
                             totalBill: getTotalBill()
                         )));
               },
               child: FutureBuilder(
                 future: fetchData(),
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     return Visibility(
                       visible: snapshot.data.data.cartProducts.length > 0
                           ? true
                           : false,
                       child: Container(
                         margin: EdgeInsets.all(padding * 2),
                         height: height * 0.15,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(padding),
                             color: Color(0xff00A9A5)),
                         child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                         Row(
                             children: [
                           Expanded(
                               flex: 12,
                               child: Container(
                                 alignment: Alignment.center,
                                 child: Text('Proceed to Checkout',
                                     style: CustomFonts.googleBodyFont(
                                         color: Colors.white, fontSize: 22)
                                 ),
                               )
                           ),
                           Expanded(
                               flex: 2,
                               child: Container(
                                 decoration: BoxDecoration(
                                     border: Border(
                                         left: BorderSide(
                                             color: Colors.white, width: 0.5))),
                                 child: Icon(Icons.arrow_forward,
                                     color: Colors.white),
                               )),
                         ]) : Row(
                             children: [
                               Expanded(
                                   flex: 12,
                                   child: Container(
                                     alignment: Alignment.center,
                                     child: Text('الشروع في الخروج',
                                         style: CustomFonts.googleBodyFont(
                                             color: Colors.white, fontSize: 22)
                                     ),
                                   )
                               ),
                               Expanded(
                                   flex: 2,
                                   child: Container(
                                     decoration: BoxDecoration(
                                         border: Border(
                                             left: BorderSide(
                                                 color: Colors.white, width: 0.5))),
                                     child: Icon(Icons.arrow_forward,
                                         color: Colors.white),
                                   )),
                             ]),
                       ),
                     );
                   } else {
                     return Container(
                       color: Colors.black,
                     );
                   }
                 },
               ))
         ],
       ),
     ),
   );
  }
  getTotalBill(){
    double totalBill = 0.0;
    var totalList =
    new List(_getCartDetails.data.cartProducts.length);
    for (int i = 0; i < totalList.length; i++) {
      totalList[i] = (_getCartDetails.data.cartProducts[i].price) *
          (_getCartDetails.data.cartProducts[i].quantity);
    }
    for (int i = 0; i < totalList.length; i++) {
      totalBill = totalBill + totalList[i];
    }
    return totalBill;
  }
  bool onWillPop() {
    widget.myPage.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    return false;
  }
}
