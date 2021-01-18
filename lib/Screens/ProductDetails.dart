import 'package:flutter/material.dart';
import 'package:gold/Constants/Constants.dart';
import 'package:gold/SizeConfig.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
         body: ListView(
           children: [
             Container(
               height: SizeConfig.heightMultiplier * 8,
               child: Center(
                 child: Text(
                   'Shampoo',
                   style: CustomFonts.googleBodyFont(
                     color: Colors.white,
                     fontSize: SizeConfig.textMultiplier * 4
                   ),
                 ),
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
                   image: DecorationImage(
                       image: AssetImage('images/face.jpg'),
                       fit: BoxFit.cover
                   )
               ),
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
                           'Shampoo',
                           style: CustomFonts.googleBodyFont(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: SizeConfig.textMultiplier * 4,
                           ),
                         ),
                       ),
                     ),
                     Expanded(
                       child: Container(
                         alignment: Alignment.centerLeft,
                         child: Text(
                           r'$ 90.00',
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
                         alignment: Alignment.centerLeft,
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
                       flex: 8,
                       child: Container(
                        // color: Colors.red,
                         alignment: Alignment.topLeft,
                         child: Text(
                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                           style: CustomFonts.googleBodyFont(
                             color: Colors.white,
                             fontWeight: FontWeight.w200,
                             fontSize: SizeConfig.textMultiplier * 2.5,
                           ),
                           overflow: TextOverflow.ellipsis,
                           maxLines: 13,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             )
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
                onPressed: (){

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
