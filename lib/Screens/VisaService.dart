import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gold/Screens/CustomDialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaService extends StatefulWidget {
  var accessToken;
  var idCart;
  VisaService({
    this.idCart,
    this.accessToken
});
  @override
  _VisaServiceState createState() => _VisaServiceState();
}

class _VisaServiceState extends State<VisaService> {
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
          initialUrl: 'http://15.185.204.189/webapi/payment/visaservice.php?accessToken=${widget.accessToken}&id_cart=${widget.idCart}',
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
