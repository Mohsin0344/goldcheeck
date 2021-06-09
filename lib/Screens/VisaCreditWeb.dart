import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaServiceWeb extends StatefulWidget {
  var accessToken;
  var amount;
  VisaServiceWeb({
    this.amount,
    this.accessToken
  });
  @override
  _VisaServiceWebState createState() => _VisaServiceWebState();
}

class _VisaServiceWebState extends State<VisaServiceWeb> {
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
          initialUrl: 'http://15.185.204.189/webapi/payment/addcreditvisa.php?accessToken=${widget.accessToken}&amount=${widget.amount}',
          // initialUrl:'https://www.google.com',
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
            if(url.contains("visaAddCreditSuccess")){
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
