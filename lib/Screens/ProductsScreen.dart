import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/GetProducts.dart';
import 'package:gold/Screens/ProductDetails.dart';
import 'package:http/http.dart' as http;
import 'package:gold/Constants/Globals.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gold/Constants/ConstantColors.dart';

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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ConstantColors.mainBackground,
            title: Container(
              margin: EdgeInsets.only(left: SizeConfig.widthMultiplier * 21),
              child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
              Text(
                'Products',
                style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
                textAlign: TextAlign.center,
              ):
              Text(
                'منتجات',
                style: CustomFonts.googleBodyFont(color: ConstantColors.textColor),
                textAlign: TextAlign.center,
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: ConstantColors.buttonColor,
              ),
            ),
          ),
          backgroundColor: ConstantColors.mainBackground,
          body: FutureBuilder(
            future: getAllProducts(),
            builder:
                (BuildContext context, AsyncSnapshot<GetProducts> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.data.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: SizeConfig.widthMultiplier * 8,
                      mainAxisSpacing: SizeConfig.heightMultiplier * 0,
                      childAspectRatio: 1/0.95,
                      crossAxisCount: SizeConfig.isPortrait ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
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
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.widthMultiplier * 1.5,
                          right: SizeConfig.widthMultiplier * 1.5
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: SizeConfig.heightMultiplier * 2
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data.data.list[index].photoUrl,),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                 // color: Colors.blue,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${snapshot.data.data.list[index].name}',
                                            style: CustomFonts.googleBodyFont(
                                              color: ConstantColors.textColor,
                                              fontSize: SizeConfig.textMultiplier * 2
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '\KD ${snapshot.data.data.list[index].price}',
                                            style: CustomFonts.googleBodyFont(
                                                color: ConstantColors.textColor,
                                                fontSize: SizeConfig.textMultiplier * 1.5
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              )
                            ],
                          ),
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
          )),
    );
  }
}
