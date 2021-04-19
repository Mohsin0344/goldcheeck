import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/GetProducts.dart';
import 'package:gold/Screens/ProductDetails.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';
import 'package:page_transition/page_transition.dart';

class ProductsScreen extends StatefulWidget {
  var accessToken;
  var cartLength;
  var firstName;
  var lastName;
  PageController myPage;
  ProductsScreen({this.accessToken,this.cartLength,this.firstName,this.lastName,
    this.myPage
  });

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  GetProducts _getProducts;

  Future<GetProducts> getAllProducts() async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": widget.accessToken,
      "action": "product/getProductList",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return getProductsFromJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("At products Screen **************** ${widget.accessToken}");
    print("At products${widget.firstName + widget.lastName}");
    bool onWillPop() {
      widget.myPage.previousPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      return false;
    }
    return WillPopScope(
      onWillPop:()=> Future.sync(onWillPop),
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Container(
                margin: EdgeInsets.only(left: SizeConfig.widthMultiplier * 21),
                child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                Text(
                  'Products',
                  style: CustomFonts.googleBodyFont(color: Colors.white),
                  textAlign: TextAlign.center,
                ):
                Text(
                  'منتجات',
                  style: CustomFonts.googleBodyFont(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: Colors.black,
            body: Container(
              child: FutureBuilder(
                future: getAllProducts(),
                builder:
                    (BuildContext context, AsyncSnapshot<GetProducts> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.data.list.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ProductDetails(
                                      name: snapshot.data.data.list[index].name,
                                      image:
                                          snapshot.data.data.list[index].photoUrl,
                                      price: snapshot.data.data.list[index].price,
                                      description: snapshot
                                          .data.data.list[index].descriptionShort,
                                      accessToken: widget.accessToken,
                                      productID: snapshot
                                          .data.data.list[index].idProduct,
                                      cartLength: widget.cartLength,
                                      firstName: widget.firstName,
                                      lastName: widget.lastName
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.heightMultiplier * 3),
                            height: SizeConfig.heightMultiplier * 18,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff3D4051),
                                      Color(0xff747683),
                                      Color(0xffA4A5AB),
                                      Color(0xffF0F0F0),
                                    ]),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                )),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.isMobilePortrait
                                              ? SizeConfig.widthMultiplier * 4
                                              : SizeConfig.widthMultiplier * 8,
                                          vertical:
                                              SizeConfig.heightMultiplier * 3),
                                      child: Container(
                                        child: Image.network(
                                          snapshot.data.data.list[index].photoUrl,
                                          fit: BoxFit.cover,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          // image: DecorationImage(
                                          //     image: Image.network('images/face.jpg'),
                                          //     fit: BoxFit.cover
                                          // )
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: SizeConfig.isMobilePortrait ? 4 : 7,
//flex: 4,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.heightMultiplier * 2),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                '${snapshot.data.data.list[index].name}',
                                                style: CustomFonts.googleBodyFont(
                                                    color: Colors.black,
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        3.5,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  right:
                                                      SizeConfig.widthMultiplier *
                                                          2),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '${snapshot.data.data.list[index].descriptionShort}',
                                                style: CustomFonts.googleBodyFont(
                                                    color: Colors.black,
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        2.5,
                                                    fontWeight: FontWeight.w300),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "\$ ${snapshot.data.data.list[index].price}",
                                                style: CustomFonts.googleBodyFont(
                                                    color: Color(0xff00A9A5),
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        3,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
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
            )),
      ),
    );
  }
}
