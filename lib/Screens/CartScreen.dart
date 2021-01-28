import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Models/GetCartDetails.dart';
import 'package:gold/SizeConfig.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  var accessToken;
  var context;
  CartScreen({
    this.accessToken,
    this.context,

});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

  GetCartDetails _getCartDetails;
  Future<GetCartDetails> getDetails() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers:
    {
      "key" : "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    },
        body:
        {
          "accessToken" : widget.accessToken,
          "action" : "cart/getCartDetail"
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
   GetCartDetails Details= await getDetails();

     _getCartDetails=Details;
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
    print("AT Cart Screen 00000000000000000000000000000000000000000000000000000${widget.accessToken}");
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        //physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.center,
            height: height * 0.25,
            child: Text(
              'Cart',
              style: CustomFonts.googleHeaderFont(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          FutureBuilder(
            future: fetchData(),
            builder: (context,  snapshot){


              if(snapshot.hasData){
                return Container(
                  padding: EdgeInsets.only(
                      left: padding * 2
                  ),
                  margin: EdgeInsets.only(
                      right: padding * 6
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: '${snapshot.data.data.cartProducts.length}',
                        style: CustomFonts.googleHeaderFont(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300
                        ),
                        children: [
                          TextSpan(
                            text: ' Items into your Cart',
                            style: CustomFonts.googleHeaderFont(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w300
                            ),
                          )
                        ]

                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          FutureBuilder(
            future: fetchData(),
            builder:(context,  snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.data.cartProducts.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index){
                    return Container(
                      margin: EdgeInsets.only(
                          top: padding
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: padding
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.white,
                                width: 0.1
                            ),
                            top: BorderSide(
                                color: Colors.white,
                                width: 0.1
                            )
                        ),
                      ),
                      height: height * 0.25,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: padding
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(padding),
                                    // image: DecorationImage(
                                    //     image: AssetImage('images/face.jpg'),
                                    //     fit: BoxFit.cover
                                    // )
                                ),
                                child: Image.network(snapshot.data.data.cartProducts[index].photoUrl,
                                fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: padding
                              ),
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
                                                child:Text(
                                                  '${snapshot.data.data.cartProducts[index].name}',
                                                  style: CustomFonts.googleHeaderFont(
                                                      color: Colors.white,
                                                      fontSize:  24,
                                                      fontWeight: FontWeight.w300
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  )
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: RichText(
                                          text: TextSpan(
                                              text: 'Quantity:',
                                              style: CustomFonts.googleHeaderFont(
                                                  color: Colors.white,
                                                  fontSize:  16,
                                                  fontWeight: FontWeight.w300
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: ' ${snapshot.data.data.cartProducts[index].quantity}',
                                                  style: CustomFonts.googleHeaderFont(
                                                      color: Colors.white,
                                                      fontSize:  16,
                                                      fontWeight: FontWeight.w300
                                                  ),
                                                )
                                              ]
                                          ),
                                        )

                                    ),
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
                                                      style: CustomFonts.googleHeaderFont(
                                                          color: Colors.white,
                                                          fontSize:  16,
                                                          fontWeight: FontWeight.w300
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' Black',
                                                          style: CustomFonts.googleHeaderFont(
                                                              color: Colors.white,
                                                              fontSize:  16,
                                                              fontWeight: FontWeight.w300
                                                          ),
                                                        )
                                                      ]
                                                  ),
                                                )
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Text("\$ ${(snapshot.data.data.cartProducts[index].price)*snapshot.data.data.cartProducts[index].quantity}",
                                                style: CustomFonts.googleHeaderFont(
                                                    color: Colors.yellow.withOpacity(0.8),
                                                    fontSize:  16,
                                                    fontWeight: FontWeight.w300
                                                ),
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
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Container(
            margin: EdgeInsets.all(
                padding * 2
            ),
            height: height * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(padding),
                color: Color(0xff00A9A5)
            ),
            child: Row(
                children: [
                  Expanded(
                      flex: 12,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Proceed to Checkout',
                            style: CustomFonts.googleBodyFont(
                                color: Colors.white,
                                fontSize: 22
                            )
                        ),
                      )
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.white,
                                    width: 0.5
                                )
                            )
                        ),
                        child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white
                        ),
                      )
                  ),
                ]
            ),
          )
        ],
      ),
    );
  }
}
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:gold/Constants/Constants.dart';
// import 'package:gold/Models/GetCartDetails.dart';
// import 'package:gold/SizeConfig.dart';
// import 'package:http/http.dart' as http;
//
// class CartScreen extends StatefulWidget {
//   var accessToken;
//   CartScreen({
//     this.accessToken,
//   });
//   @override
//   _CartScreenState createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   StreamController _postsController;
//   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
//   var height = SizeConfig.imageSizeMultiplier * 100;
//   var width = SizeConfig.imageSizeMultiplier * 200;
//   var padding = CustomSizes.padding;
//
//   //GetCartDetails _getCartDetails;
//   Future<GetCartDetails> getDetails() async {
//     final String url = "http://15.185.204.189/webapi/server.php";
//     final response = await http.post(url, headers:
//     {
//       "key" : "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
//     },
//         body:
//         {
//           "accessToken" : widget.accessToken,
//           "action" : "cart/getCartDetail"
//         });
//     if (response.statusCode == 200) {
//       final String responseString = response.body;
//       print(responseString.toString());
//       return getCartDetailsFromJson(responseString);
//     } else {
//       print(response.statusCode);
//     }
//   }
//   loadPosts() async {
//     getDetails().then((res) async {
//       _postsController.add(res);
//       return res;
//     });
//   }
//   Future<Null> _handleRefresh() async {
//     getDetails().then((res) async {
//       _postsController.add(res);
//       return null;
//     });
//   }
//
//   @override
//   void initState() {
//     _postsController = new StreamController();
//     loadPosts();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     print("AT Cart Screen 00000000000000000000000000000000000000000000000000000${widget.accessToken}");
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: ListView(
//         //physics: NeverScrollableScrollPhysics(),
//         children: [
//           Container(
//             alignment: Alignment.center,
//             height: height * 0.25,
//             child: Text(
//               'Cart',
//               style: CustomFonts.googleHeaderFont(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold
//               ),
//             ),
//           ),
//           StreamBuilder(
//             stream: _postsController.stream,
//             builder: (BuildContext context, AsyncSnapshot snapshot){
//               if(snapshot.hasData){
//                 return Container(
//                   padding: EdgeInsets.only(
//                       left: padding * 2
//                   ),
//                   margin: EdgeInsets.only(
//                       right: padding * 6
//                   ),
//                   child: RichText(
//                     text: TextSpan(
//                         text: '${snapshot.data.data.cartProducts.length}',
//                         style: CustomFonts.googleHeaderFont(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.w300
//                         ),
//                         children: [
//                           TextSpan(
//                             text: ' Items into your Cart',
//                             style: CustomFonts.googleHeaderFont(
//                                 color: Colors.white,
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w300
//                             ),
//                           )
//                         ]
//
//                     ),
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//           StreamBuilder(
//             stream: _postsController.stream,
//             builder:(BuildContext context, AsyncSnapshot snapshot){
//               if(snapshot.hasData){
//                 return ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data.data.cartProducts.length,
//                   shrinkWrap: true,
//                   itemBuilder: (BuildContext context, index){
//                     return Container(
//                       margin: EdgeInsets.only(
//                           top: padding
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           vertical: padding
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 color: Colors.white,
//                                 width: 0.1
//                             ),
//                             top: BorderSide(
//                                 color: Colors.white,
//                                 width: 0.1
//                             )
//                         ),
//                       ),
//                       height: height * 0.25,
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: padding
//                               ),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow.withOpacity(0.8),
//                                     borderRadius: BorderRadius.circular(padding),
//                                     image: DecorationImage(
//                                         image: AssetImage('images/face.jpg'),
//                                         fit: BoxFit.cover
//                                     )
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Container(
//                               margin: EdgeInsets.only(
//                                   left: padding
//                               ),
//                               child: Column(
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                         alignment: Alignment.topLeft,
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               flex: 4,
//                                               child: Container(
//                                                 child:Text(
//                                                   '${snapshot.data.data.cartProducts[index].name}',
//                                                   style: CustomFonts.googleHeaderFont(
//                                                       color: Colors.white,
//                                                       fontSize:  24,
//                                                       fontWeight: FontWeight.w300
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Container(
//                                                   child: Icon(
//                                                     Icons.close,
//                                                     color: Colors.white,
//                                                   )
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                         alignment: Alignment.bottomLeft,
//                                         child: RichText(
//                                           text: TextSpan(
//                                               text: 'Quantity:',
//                                               style: CustomFonts.googleHeaderFont(
//                                                   color: Colors.white,
//                                                   fontSize:  16,
//                                                   fontWeight: FontWeight.w300
//                                               ),
//                                               children: [
//                                                 TextSpan(
//                                                   text: ' 1',
//                                                   style: CustomFonts.googleHeaderFont(
//                                                       color: Colors.white,
//                                                       fontSize:  16,
//                                                       fontWeight: FontWeight.w300
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                         )
//
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       child: Row(
//                                         children: [
//                                           Expanded(
//                                             flex: 6,
//                                             child: Container(
//                                                 alignment: Alignment.topLeft,
//                                                 child: RichText(
//                                                   text: TextSpan(
//                                                       text: 'Color:',
//                                                       style: CustomFonts.googleHeaderFont(
//                                                           color: Colors.white,
//                                                           fontSize:  16,
//                                                           fontWeight: FontWeight.w300
//                                                       ),
//                                                       children: [
//                                                         TextSpan(
//                                                           text: ' Black',
//                                                           style: CustomFonts.googleHeaderFont(
//                                                               color: Colors.white,
//                                                               fontSize:  16,
//                                                               fontWeight: FontWeight.w300
//                                                           ),
//                                                         )
//                                                       ]
//                                                   ),
//                                                 )
//                                             ),
//                                           ),
//                                           Expanded(
//                                             flex: 2,
//                                             child: Container(
//                                               child: Text("\$ ${snapshot.data.data.cartProducts[index].price}",
//                                                 style: CustomFonts.googleHeaderFont(
//                                                     color: Colors.yellow.withOpacity(0.8),
//                                                     fontSize:  16,
//                                                     fontWeight: FontWeight.w300
//                                                 ),
//                                                 textAlign: TextAlign.right,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//           Container(
//             margin: EdgeInsets.all(
//                 padding * 2
//             ),
//             height: height * 0.15,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(padding),
//                 color: Color(0xff00A9A5)
//             ),
//             child: Row(
//                 children: [
//                   Expanded(
//                       flex: 12,
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Text('Proceed to Checkout',
//                             style: CustomFonts.googleBodyFont(
//                                 color: Colors.white,
//                                 fontSize: 22
//                             )
//                         ),
//                       )
//                   ),
//                   Expanded(
//                       flex: 2,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 left: BorderSide(
//                                     color: Colors.white,
//                                     width: 0.5
//                                 )
//                             )
//                         ),
//                         child: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white
//                         ),
//                       )
//                   ),
//                 ]
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
