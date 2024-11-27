import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ots/ots.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SchoolWeb extends StatefulWidget {
  final String url = Get.arguments[0];
  final String title = Get.arguments[1];
  SchoolWeb({Key? key}) : super(key: key);

  @override
  _SchoolWebState createState() => _SchoolWebState();
}

class _SchoolWebState extends State<SchoolWeb> {
  WebViewController? webViewController;


  @override
  void dispose() {
    // TODO: implement dispose
    curr();
    hideLoader();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebViewWidget(controller: webViewController!);
      }),
    );
  }


  void curr(){
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

}