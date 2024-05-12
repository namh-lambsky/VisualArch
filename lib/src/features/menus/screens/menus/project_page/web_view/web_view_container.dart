import 'package:flutter/material.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;
  const WebViewContainer({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  @override
  Widget build(BuildContext context) {
    final webViewController=WebViewController()..setBackgroundColor(Colors.white)..loadRequest(Uri.parse(widget.url));
    
    return WebViewWidget(controller: webViewController);
  }
}
