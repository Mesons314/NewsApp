
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget{
  String blogUrl;

  ArticleView({required this.blogUrl});
  @override
  State<StatefulWidget> createState() {
   return articleScreen();
  }
}

class articleScreen extends State<ArticleView>{
  late WebViewController controller;

  @override
  void initState(){
    super.initState();
    controller = WebViewController()
    ..loadRequest(Uri.parse(widget.blogUrl));
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("News"),
     ),
     body: Container(
       child: WebViewWidget(controller: controller)
     ),
   );
  }

}
