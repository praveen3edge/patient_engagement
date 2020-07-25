import 'package:flutter/material.dart';
import 'package:patientengagement/ui/common/app_bar.dart';
import 'package:patientengagement/ui/common/common_export.dart';
import 'package:patientengagement/ui/common/loaders.dart';


class ShowAllArticles extends StatefulWidget{
  @override
  _ShowAllArticlesState createState() => _ShowAllArticlesState();
}

class _ShowAllArticlesState extends State<ShowAllArticles> with WidgetsBindingObserver{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      callLoader(context:context,canGoBack: true);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//
//              Container(
//                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
//                      Navigator.pop(context);
//                    }),
//                    ShowHeading(title: "All Articles",),
//                  ],
//                ),
//              ),
            TopBar("All articles"),
              SizedBox(height: 0,),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async{
                    await Future.delayed(Duration(seconds: 3));
                    print("called refresh");
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ...List.generate(10, (index) =>ShowArticles()),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}