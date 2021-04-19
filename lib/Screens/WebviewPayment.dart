import 'dart:async';
import 'package:gold/Screens/SecondWebview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPayment extends StatefulWidget {
  String accessToken;
  String idCart;
  WebviewPayment({
    this.accessToken,
    this.idCart
});
  @override
  _WebviewPaymentState createState() => _WebviewPaymentState();
}

class _WebviewPaymentState extends State<WebviewPayment> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool link = true;
  var newToken;
  var trackId;
  var paymentType;
  var idCart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.accessToken);
    print(widget.idCart);
    return Material(
      child: Scaffold(
       body: WebView(
         debuggingEnabled: true,
         initialUrl: 'http://15.185.204.189/webapi/payment/prepare.php?accessToken=${widget.accessToken}==&id_cart=${widget.idCart}',
         // initialUrl:'https://www.google.com',
         javascriptMode: JavascriptMode.unrestricted,
         onProgress: (int progress) {
           print("WebView is loading (progress : $progress%)");
         },
           onPageStarted: (String url) {
             print('Page started loading: $url');
           },
           onPageFinished: (String url) {
             print('Page finished loading: $url');
             // var uri = Uri.parse(url);
             // print(uri.base.toString());
             // print(Uri.base.query);
             // print(Uri.base.queryParameters['paymentType']);
             // print(Uri.base.queryParameters['idCart']);
             // print(Uri.base.queryParameters['encrp']);
             var uri = Uri.parse(url);
             // print(uri.queryParameters['accessToken']);
             // print(uri.queryParameters['amp;trackid']);
             // print(uri.queryParameters['amp;paymentType']);
             // print(uri.queryParameters['amp;id_cart']);
             if (uri.queryParameters['accessToken'] != null) {
               print('im here mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm');
               setState(() {
                 newToken = uri.queryParameters['accessToken'];
                 trackId = uri.queryParameters['amp;trackid'];
                 paymentType = uri.queryParameters['amp;paymentType'];
                 idCart = uri.queryParameters['amp;id_cart'];
                 link = false;
               });
               // uri.queryParameters.forEach((k, v) {
               //   print('key: $k - value: $v');
               // });
               print(newToken);
               print(trackId);
               print(paymentType);
               print(idCart);
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => SecondWebView(newToken: newToken,
                 trackId: trackId,
                   paymentType: paymentType,
                   idCart: idCart,
                 )),
               );
             }
           },
         gestureNavigationEnabled: true,
         onWebViewCreated: (WebViewController webViewController) {
           _controller.complete(webViewController);
         },
       ),
      ),
    );
  }
}
