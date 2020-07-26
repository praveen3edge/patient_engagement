import 'package:flutter/material.dart';
import 'package:patientengagement/block/article_block.dart';
import 'package:patientengagement/models/articles_model.dart';
import 'package:patientengagement/ui/common/common_class.dart';
import 'package:patientengagement/ui/common/loaders.dart';
import 'package:patientengagement/utils/colors.dart';
import 'package:patientengagement/ui/common/common_export.dart';

class LearnUi extends StatefulWidget {
  @override
  _LearnUiState createState() => _LearnUiState();
}

class _LearnUiState extends State<LearnUi> with WidgetsBindingObserver{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      callLoader(context: context);
      await ArticlesProvider.of(context).getInitialArticleData();
      Navigator.pop(context);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
      child: Container(
        child: RefreshIndicator(
          onRefresh: () async {
              callLoader(context: context);
              ArticlesProvider.of(context).refresh = true;
              await ArticlesProvider.of(context).getInitialArticleData();
              Navigator.pop(context);
            },
          backgroundColor: AppColor.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StreamBuilder<List<ArticlesModel>>(
                    stream: ArticlesProvider.of(context).articlesStream,
                    builder: (context, snap) {
                  if (!snap.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ShowHeading(
                          title: "Articles",
                          subTitle: "ALL ARTICLES",
//                          callBack: () {
//                            Navigator.of(context).pushNamed('/allarticles');
//                          },
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    );
                  } else if (snap.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ShowHeading(
                          title: "Articles",
                        ),
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

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ShowHeading(
                        title: "Articles",
                        subTitle: "ALL ARTICLES",
                        callBack: snap.data.length > 1
                            ? () {
                                Navigator.of(context).pushNamed('/allarticles');
                              }
                            : null,
                      ),
                      snap.data.length > 0
                          ? ShowArticles(snap.data[0])
                          : new Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: new Text(
                                  "No article found",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          color: AppColor.blackCommon
                                              .withOpacity(0.3),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                    ],
                  );
                }),


                /// video part

                StreamBuilder<List<VideoModel>>(
                    stream: ArticlesProvider.of(context).videoArticleStream,
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ShowHeading(
                              title: "Videos",
                            ),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        );
                      } else if (snap.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ShowHeading(
                              title: "Videos",

                            ),
                            new Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: new Text(
                                  "No video found",
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

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ShowHeading(
                            title: "Videos",
                            subTitle: "ALL VIDEOS",
                            callBack: () {
                              Navigator.of(context).pushNamed('/allvideos');
                            },
                          ),
                          snap.data.length > 0
                              ? ShowVideos(snap.data[0])
                              : new Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: new Text(
                                "No video found",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                    color: AppColor.blackCommon
                                        .withOpacity(0.3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),


                /// Health tips stream

                StreamBuilder<List<ArticlesModel>>(
                    stream: ArticlesProvider.of(context).exerciseTipStream,
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ShowHeading(
                              title: "Health Tips",

                            ),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        );
                      } else if (snap.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ShowHeading(
                              title: "Health Tips",
                            ),
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

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ShowHeading(
                            title: "Health Tips",
                            subTitle: "ALL TIPS",
                            callBack: snap.data.length > 1
                                ? () {
                              Navigator.of(context).pushNamed('/allhealthtip');
                            }
                                : null,
                          ),
                          snap.data.length > 0
                              ? ShowArticles(snap.data[0])
                              : new Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: new Text(
                                "No article found",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                    color: AppColor.blackCommon
                                        .withOpacity(0.3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),


                /// Yoga guru

                StreamBuilder<List<ArticlesModel>>(
                    stream: ArticlesProvider.of(context).yogaTipStream,
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ShowHeading(
                              title: "Yoga Guru",

                            ),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        );
                      } else if (snap.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ShowHeading(
                              title: "Yoga Guru",
                            ),
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

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ShowHeading(
                            title: "Yoga Guru",
                            subTitle: "ALL YOGA TIPS",
                            callBack: snap.data.length > 1
                                ? () {
                              Navigator.of(context).pushNamed('/allyogatip');
                            }
                                : null,
                          ),
                          snap.data.length > 0
                              ? ShowArticles(snap.data[0])
                              : new Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: new Text(
                                "No article found",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                    color: AppColor.blackCommon
                                        .withOpacity(0.3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),

                SizedBox(
                  height: 100,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


