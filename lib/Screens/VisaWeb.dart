import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold/Constants/ConstantColors.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaWeb extends StatefulWidget {
  var accessToken;
  var idCart;
  VisaWeb({
    this.idCart,
    this.accessToken
});
  @override
  _VisaWebState createState() => _VisaWebState();
}

class _VisaWebState extends State<VisaWeb> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool link = true;
  var newToken;
  var trackId;
  var paymentType;
  var idCart;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: WebView(
          debuggingEnabled: true,
          initialUrl: 'http://15.185.204.189/webapi/payment/visa.php?accessToken=${widget.accessToken}&id_cart=${widget.idCart}',
          // initialUrl:'https://www.google.com',
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
            if(url.contains("visaSuccess")){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      message: 'Success',
                      icon: Icons.check,
                      check: '1',
                    );
                  });
            }
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');

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
