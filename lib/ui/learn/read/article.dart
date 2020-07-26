import 'package:flutter/material.dart';
import 'package:patientengagement/ui/common/app_bar.dart';
import 'package:patientengagement/ui/common/common_class.dart';
import 'package:patientengagement/ui/common/loaders.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:patientengagement/utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';

class ReadArticle extends StatefulWidget {
  String url;
  String name;
  ReadArticle(this.url,this.name);
  @override
  _ReadArticleArticleState createState() => _ReadArticleArticleState();
}

class _ReadArticleArticleState extends State<ReadArticle> with WidgetsBindingObserver{
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callLoader(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(widget.name),
            Expanded(
              child: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: (x) {
                  return NavigationDecision.prevent;
                },
                onPageStarted: (url){
//                  callLoader(context: context);

                },
                onPageFinished: (url){

                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
//
//Scaffold(
//body: Padding(
//padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//child: Container(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Container(
//child: new Row(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
//Navigator.pop(context);
//}),
//ShowHeading(title: "What is healthy living ?",),
//],
//),
//),
//
//SizedBox(height: 20,),
//
//Expanded(
//child: SingleChildScrollView(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//SizedBox(height: 20,),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text("HEALTHY HABITS: 10 daily habits that may change your life",style: Theme.of(context).textTheme.headline4.copyWith(
//fontSize: 16,color: AppColor.blackCommon
//),),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text('''Your attitude determines your altitude. "Succesful people don't just drift off to the top. Getting there requires focused action, personal discipline and lots of energy every day to make things happen," says American author and entrepreneur Jack Canfield. And he couldn't be more accurate.So, don't let old habits hold you back. Start building these simple yet essential habits for a happier and more productive life:''',style: Theme.of(context).textTheme.headline4.copyWith(
//fontSize: 14,
//),),
//),
//
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text('''Your attitude determines your altitude. "Succesful people don't just drift off to the top. Getting there requires focused action, personal discipline and lots of energy every day to make things happen," says American author and entrepreneur Jack Canfield. And he couldn't be more accurate.So, don't let old habits hold you back. Start building these simple yet essential habits for a happier and more productive life:''',style: Theme.of(context).textTheme.headline4.copyWith(
//fontSize: 14,
//),),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text('''Your attitude determines your altitude. "Succesful people don't just drift off to the top. Getting there requires focused action, personal discipline and lots of energy every day to make things happen," says American author and entrepreneur Jack Canfield. And he couldn't be more accurate.So, don't let old habits hold you back. Start building these simple yet essential habits for a happier and more productive life:''',style: Theme.of(context).textTheme.headline4.copyWith(
//fontSize: 14,
//),),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text('''Your attitude determines your altitude. "Succesful people don't just drift off to the top. Getting there requires focused action, personal discipline and lots of energy every day to make things happen," says American author and entrepreneur Jack Canfield. And he couldn't be more accurate.So, don't let old habits hold you back. Start building these simple yet essential habits for a happier and more productive life:''',style: Theme.of(context).textTheme.headline4.copyWith(
//fontSize: 14,
//),),
//)
//],
//),
//),
//)
//
//],
//),
//),
//),
//);
