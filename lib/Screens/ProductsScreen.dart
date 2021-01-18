import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/Screens/ProductDetails.dart';
import 'package:gold/SizeConfig.dart';
import 'package:page_transition/page_transition.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Products',
              style: CustomFonts.googleBodyFont(
                color: Colors.white
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ProductDetails()));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.heightMultiplier * 3
                  ),
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
                          ]
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:SizeConfig.isMobilePortrait?SizeConfig.widthMultiplier*4:SizeConfig.widthMultiplier*8,
                                vertical: SizeConfig.heightMultiplier *3
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                      image: AssetImage('images/face.jpg'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          flex: SizeConfig.isMobilePortrait?4:7,
                          //flex: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical:SizeConfig.heightMultiplier *2
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Shampoo',
                                      style: CustomFonts.googleBodyFont(
                                          color: Colors.black,
                                          fontSize: SizeConfig.textMultiplier * 5,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      r'$ 90.00',
                                      style: CustomFonts.googleBodyFont(
                                          color: Color(0xff00A9A5),
                                          fontSize: SizeConfig.textMultiplier * 3,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ),
    );
  }
}
