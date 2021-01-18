import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/SizeConfig.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var height = SizeConfig.imageSizeMultiplier * 100;
  var width = SizeConfig.imageSizeMultiplier * 200;
  var padding = CustomSizes.padding;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        Container(
          padding: EdgeInsets.only(
            left: padding * 2
          ),
          margin: EdgeInsets.only(
            right: padding * 6
          ),
          child: RichText(
            text: TextSpan(
              text: '4',
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
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
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
                          image: DecorationImage(
                            image: AssetImage('images/face.jpg'),
                            fit: BoxFit.cover
                          )
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
                                        'Product title here here',
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
                                     text: ' 1',
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
                                      child: Text(r'$120',
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
    );
  }
}
