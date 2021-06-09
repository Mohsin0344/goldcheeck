import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Constants/SizeConfig.dart';
import 'package:gold/Models/AddToCart.dart';
import 'package:gold/Models/GetCartDetails.dart';
import 'package:gold/Screens/CartScreen.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'CustomDialog.dart';
import 'package:gold/Constants/Globals.dart';
import 'package:gold/Constants/ConstantColors.dart';

class ProductDetails extends StatefulWidget {
  var name;
  var image;
  var description;
  var price;
  var accessToken;
  var productID;
  var cartLength;
  var firstName;
  var lastName;
  ProductDetails(
      {this.name,
      this.image,
      this.description,
      this.price,
      this.accessToken,
      this.productID,
      this.cartLength,
        this.firstName,
        this.lastName
      });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  AddToCart _addToCart;
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

  Future<AddToCart> addToCartNow(int quantityy) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers: {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    }, body: {
      "accessToken": "${widget.accessToken}",
      "action": "cart/addToCart",
      "id_product": "${widget.productID}",
      "quantity": "$quantityy",
      "lang": App.localStorage.getString("lang"),
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString.toString());
      return addToCartFromJson(responseString);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("At Product details xxxxxxxxxxxxx ${widget.accessToken}");
    // print("At product Details ----->>>>>>>${widget.firstName + widget.lastName}");
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ConstantColors.mainBackground,
          body: ListView(
            children: [
              Container(
                height: SizeConfig.heightMultiplier * 8,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 2),
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back,
                            color: ConstantColors.buttonColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        //color: Colors.red,
                        margin: EdgeInsets.only(
                            left: SizeConfig.widthMultiplier * 10),
                        alignment: Alignment.center,
                        child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                        Text(
                          'Product Details',
                          style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor,
                              fontSize: SizeConfig.textMultiplier * 2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ):   Text(
                          'تفاصيل المنتج',
                          style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor,
                              fontSize: SizeConfig.textMultiplier * 2),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                        ,
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(
                                    8 * 1.5
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 30,
                                      child: Container(
                                        child: IconButton(
                                          iconSize: 30.0,
                                          icon: Icon(Icons.shopping_cart),
                                          color:  ConstantColors.buttonColor,
                                          onPressed: () {
                                            Navigator.push(context,
                                                PageTransition(
                                                    type: PageTransitionType.rightToLeft,
                                                    child:   CartScreen(
                                                      firstName: widget.firstName,
                                                      lastName : widget.lastName,
                                                      context: this.context,
                                                      accessToken: widget.accessToken,
                                                      arrowValue: "1",
                                                    ),

                                                ));
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                left: 35,
                                top: 5,
                                child: FutureBuilder(
                                  future: fetchData(),
                                  builder: (context,snapshot){
                                    if(snapshot.hasData){
                                      return Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: SizeConfig.heightMultiplier * 5 ,
                                          width: SizeConfig.widthMultiplier * 5,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ConstantColors.buttonColor
                                          ),
                                          child: Text(
                                            '${snapshot.data.data.cartProducts.length}',
                                            style: CustomFonts.googleBodyFont(
                                                color: ConstantColors.textColor
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
              Container(
                margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 1.5),
                height: SizeConfig.heightMultiplier * 32,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage('images/face.jpg'),
                    //     fit: BoxFit.cover
                    // )
                    ),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.widthMultiplier * 2,
                    right: SizeConfig.widthMultiplier * 2),
                child: Container(
                  height: SizeConfig.heightMultiplier * 55,
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.name}',
                          style: CustomFonts.googleBodyFont(
                            color: ConstantColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.textMultiplier * 4,
                          ),
                        ),
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '\KD ${widget.price}',
                                style: CustomFonts.googleBodyFont(
                                  color: ConstantColors.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.textMultiplier * 2.5,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ConstantColors.buttonColor, width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ConstantColors.buttonColor),
                                          child: Icon(
                                            Icons.add,
                                            color: ConstantColors.backgroundColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$quantity',
                                        style: CustomFonts.googleBodyFont(
                                            color: ConstantColors.textColor,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    2.5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: InkWell(
                                        onTap: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity = quantity - 1;
                                            });
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ConstantColors.buttonColor),
                                          child: Icon(
                                            Icons.remove,
                                            color: ConstantColors.backgroundColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                          Text(
                            r'Description',
                            style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.textMultiplier * 2.5,
                            ),
                          ):
                          Text(
                            r'وصف',
                            style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.textMultiplier * 2.5,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            " ${widget.description}",
                            style: CustomFonts.googleBodyFont(
                              color: ConstantColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.textMultiplier * 2.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.widthMultiplier,
                right: SizeConfig.widthMultiplier,
                bottom: SizeConfig.heightMultiplier),
            child: Container(
              height: SizeConfig.heightMultiplier * 7,
              decoration: BoxDecoration(
                  color: ConstantColors.buttonColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: RaisedButton(
                child: App.localStorage.getString("lang") == "en"|| App.localStorage.getString("lang") == null?
                Text(
                  'Add to Cart',
                  style: CustomFonts.googleBodyFont(
                      color: ConstantColors.textColor,
                      fontSize: SizeConfig.textMultiplier * 2),
                ):
                Text(
                  'أضف إلى السلة',
                  style: CustomFonts.googleBodyFont(
                      color: ConstantColors.textColor,
                      fontSize: SizeConfig.textMultiplier * 2),
                ),
                color: ConstantColors.buttonColor,
                onPressed: () async {
                  print("im here");
                  final AddToCart addToCart = await addToCartNow(quantity);
                  setState(() {
                    _addToCart = addToCart;
                  });
                  if (_addToCart.status == 1) {
                    print(
                        'Product addded to cart successfuly aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                    CartScreen(accessToken: widget.accessToken);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialogBox(
                            message: "Product added",
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
                            message: _addToCart.message,
                            icon: Icons.error_outline,
                          );
                        });
                  }
                  setState(() {
                    quantity = 1;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
