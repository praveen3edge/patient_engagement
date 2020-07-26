import 'package:flutter/material.dart';
import 'package:patientengagement/block/article_block.dart';
import 'package:patientengagement/models/articles_model.dart';
import 'package:patientengagement/ui/common/app_bar.dart';
import 'package:patientengagement/ui/common/common_export.dart';
import 'package:patientengagement/ui/common/loaders.dart';
import 'package:patientengagement/utils/colors.dart';


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
    int l = 0 ;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          child: RefreshIndicator(
            onRefresh: () async {
              callLoader(context: context);
              ArticlesProvider.of(context).refresh = true;
              await ArticlesProvider.of(context).getInitialArticleData();
              Navigator.pop(context);
            },
            child: SingleChildScrollView(
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


                  StreamBuilder<List<ArticlesModel>>(
                      stream: ArticlesProvider.of(context).articlesStream,
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return Container();
                        } else if (snap.hasError) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: new Text(
                                    "No article found",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(
                                        color:
                                        AppColor.blackCommon.withOpacity(0.3),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        l = snap.data.length;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ...List.generate(snap.data.length, (index) =>ShowArticles(snap.data[index])),
                          ],
                        );
                      }),
                  l < 9?Container(height: MediaQuery.of(context).size.height,):Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}