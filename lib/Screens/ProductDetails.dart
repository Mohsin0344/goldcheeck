import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Models/AddToCart.dart';
import 'package:gold/Screens/CartScreen.dart';
import 'package:gold/SizeConfig.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import 'CustomDialog.dart';

class ProductDetails extends StatefulWidget {
  var name;
  var image;
  var description;
  var price;
  var accessToken;
  var productID;
  ProductDetails({
    this.name,
    this.image,
    this.description,
    this.price,
    this.accessToken,
    this.productID
});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  AddToCart _addToCart;
  Future<AddToCart> addToCartNow(int quantityy) async {
    final String url = "http://15.185.204.189/webapi/server.php";
    final response = await http.post(url, headers:
    {
      "key": "542A9M87SDKL2M728WQIMC4DSQLU9LL3"
    },
        body:
        {
          "accessToken" : "${widget.accessToken}",
          "action" : "cart/addToCart",
          "id_product": "${widget.productID}",
          "quantity" : "2"
        });
    if(response.statusCode == 200){
      final String responseString = response.body;
      // print(responseString.toString());
      return addToCartFromJson(responseString);
    }else{
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    print("At Product details xxxxxxxxxxxxx ${widget.accessToken}");
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
         body: ListView(
           children: [
             Container(
               height: SizeConfig.heightMultiplier * 8,
               child: Row(
                 children: [
                   Expanded(
                     child: InkWell(
                       onTap: (){
                         Navigator.pop(context);
                       },
                       child: Container(
                         padding: EdgeInsets.only(
                           left: SizeConfig.widthMultiplier * 2
                         ),
                         alignment: Alignment.centerLeft,
                         child: Icon(
                           Icons.arrow_back,
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ),
                   Expanded(
                     flex: 5,
                     child: Container(
                       //color: Colors.red,
                       margin: EdgeInsets.only(
                         right: SizeConfig.widthMultiplier * 6
                       ),
                       alignment: Alignment.center,
                       child: Text(
                         '${widget.name}',
                         style: CustomFonts.googleBodyFont(
                             color: Colors.white,
                             fontSize: SizeConfig.textMultiplier * 3.2
                         ),
                         overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                       ),
                     ),
                   )
                 ],
               ),
               decoration: BoxDecoration(
                 border: Border(
                   top: BorderSide(
                     color: Colors.blue,
                     width: 2
                   )
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.only(
                 top: SizeConfig.heightMultiplier * 1.5
               ),
               height: SizeConfig.heightMultiplier * 32,
               decoration: BoxDecoration(
                   // image: DecorationImage(
                   //     image: AssetImage('images/face.jpg'),
                   //     fit: BoxFit.cover
                   // )
               ),
               child: Image.network(widget.image, fit: BoxFit.cover,),
             ),
             Padding(
               padding: EdgeInsets.only(
                 left: SizeConfig.widthMultiplier * 2,
                 right: SizeConfig.widthMultiplier * 2
               ),
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
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: SizeConfig.textMultiplier * 4,
                           ),
                         ),
                       )
                     ),
                     Expanded(
                       child: Row(
                         children: [
                           Expanded(
                             flex: 2,
                             child: Container(
                               alignment: Alignment.centerLeft,
                               child: Text(
                                 '\$ ${widget.price}',
                                 style: CustomFonts.googleBodyFont(
                                   color: Colors.white,
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
                                   color: Colors.green,
                                   width: 1
                                 ),
                                 borderRadius: BorderRadius.circular(20)
                               ),
                               child: Row(
                                 children: [
                                   Expanded(
                                     child: Padding(
                                       padding: EdgeInsets.all(4),
                                       child: InkWell(
                                         onTap: (){
                                           setState(() {
                                             quantity = quantity + 1;
                                           });
                                         },
                                         child: Container(
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Colors.green
                                           ),
                                           child: Icon(
                                             Icons.add,
                                             color: Colors.white,
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
                                           color: Colors.white,
                                           fontSize: SizeConfig.textMultiplier * 2.5
                                         ),
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                     child: Padding(
                                       padding: EdgeInsets.all(4),
                                       child: InkWell(
                                         onTap: (){
                                         if(quantity> 1){
                                           setState(() {

                                             quantity = quantity - 1;
                                           });
                                         }
                                         },
                                         child: Container(
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               color: Colors.green
                                           ),
                                           child: Icon(
                                             Icons.remove,
                                             color: Colors.white,
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
                       )
                     ),
                     Expanded(
                       child: Container(
                         alignment: Alignment.topLeft,
                         child: Text(
                           r'Description',
                           style: CustomFonts.googleBodyFont(
                             color: Colors.white,
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
                             color: Colors.white,
                             fontWeight: FontWeight.w200,
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
              bottom: SizeConfig.heightMultiplier
            ),
            child: Container(
              height: SizeConfig.heightMultiplier * 8,
              decoration: BoxDecoration(
                color: Color(0xff00A9A5),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: RaisedButton(
                child: Text(
                  'Add to Cart',
                  style: CustomFonts.googleBodyFont(
                    color: Colors.white,
                    fontSize: SizeConfig.textMultiplier * 2
                  ),
                ),
                color: Color(0xff00A9A5),
                onPressed: () async{
                  final AddToCart addToCart = await addToCartNow(quantity);
                  setState(() {
                    _addToCart = addToCart;
                  });
                  if (_addToCart.status == 1) {
                    print('Product addded to cart successfuly aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                    CartScreen(accessToken: widget.accessToken);
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return CustomDialogBox(message: "Product added",icon: Icons.check,);
                        }
                    );
                    // Navigator.push(context,
                    //     PageTransition(
                    //         type: PageTransitionType.rightToLeft,
                    //         child: CartScreen(accessToken: widget.accessToken)));
                  }else {
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return CustomDialogBox(message: _addToCart.message,icon: Icons.error_outline,);
                        }
                    );
                  }
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
