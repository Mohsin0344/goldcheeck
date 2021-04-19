import 'package:flutter/material.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

 class SecondWebView extends StatefulWidget {
   var newToken;
   var trackId;
   var paymentType;
   var idCart;
   SecondWebView({
     this.newToken,
     this.trackId,
     this.paymentType,
     this.idCart,
 });
   @override
   _SecondWebViewState createState() => _SecondWebViewState();
 }

 class _SecondWebViewState extends State<SecondWebView> {
   @override
   Widget build(BuildContext context) {
     return  Material(
       child: Scaffold(
         body: WebView(
           debuggingEnabled: true,
           // initialUrl:  'https://www.knet.com.kw/?accessToken=${widget.newToken}&amp;trackid=${widget.trackId}&amp;paymentType=${widget.paymentType}&amp;id_cart=${widget.idCart}',
           // initialUrl:'https://www.google.com',
           initialUrl:  'http://15.185.204.189/webapi/payment/test/index.php?accessToken=${widget.newToken}&trackid=${widget.trackId}&paymentType=${widget.paymentType}&id_cart=${widget.idCart.toString().replaceAll('?', '&')}',
           javascriptMode: JavascriptMode.unrestricted,
           onProgress: (int progress) {
             print("WebView is loading (progress : $progress%)");
           },
           onPageStarted: (String url) {
             print('Page started loading: $url');
           },
           onPageFinished: (String url) {
             print('Page finished loading: $url');
             showDialog(
                 context: context,
                 builder: (BuildContext context) {
                   return CustomDialogBox(
                     message: 'Success',
                     icon: Icons.check,
                     check: '1',
                   );
                 });
           },
           gestureNavigationEnabled: true,
         ),
       ),
     );
   }
 }
