import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppBrowser extends StatefulWidget {
 var onlineUrl;

  InAppBrowser(this.onlineUrl);

  @override
  State<InAppBrowser> createState() => _InAppBrowserState();
}

class _InAppBrowserState extends State<InAppBrowser> {
  @override
  late InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('InAppWebView Example'),
        // ),
        body: Container(
            child: Column(children: <Widget>[
          // Container(
          //   padding: EdgeInsets.all(20.0),
          //   child: Text(
          //       "CURRENT URL\n${(url.length > 50) ? url.substring(0, 50) + "..." : url}"),
          // ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey)),
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(widget.onlineUrl)),
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions()),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ),
          // ButtonBar(
          //   alignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     RaisedButton(
          //       child: Icon(Icons.arrow_back),
          //       onPressed: () {
          //         if (_webViewController != null) {
          //           _webViewController.goBack();
          //         }
          //       },
          //     ),
          //     RaisedButton(
          //       child: Icon(Icons.arrow_forward),
          //       onPressed: () {
          //         if (_webViewController != null) {
          //           _webViewController.goForward();
          //         }
          //       },
          //     ),
          //     RaisedButton(
          //       child: Icon(Icons.refresh),
          //       onPressed: () {
          //         if (_webViewController != null) {
          //           _webViewController.reload();
          //         }
          //       },
          //     ),
          //   ],
          // ),
        ])),
      ),
    );
  }
}
