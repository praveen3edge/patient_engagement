import 'package:flutter/material.dart';
import 'package:patientengagement/block/article_block.dart';
import 'package:patientengagement/models/articles_model.dart';
import 'package:patientengagement/ui/common/common_class.dart';
import 'package:patientengagement/utils/colors.dart';
import 'package:patientengagement/ui/common/common_export.dart';

class LearnUi extends StatefulWidget {
  @override
  _LearnUiState createState() => _LearnUiState();
}

class _LearnUiState extends State<LearnUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
      child: Container(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 3));
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
                          callBack: () {
                            Navigator.of(context).pushNamed('/allarticles');
                          },
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    );
                  } else if (!snap.error) {
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
                              "No article fount",
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
                                  "No article fount",
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
                StreamBuilder<List<VideoModel>>(builder: (context, snap) {}),
                ShowHeading(
                  title: "Videos",
                  subTitle: "ALL VIDEOS",
                  callBack: () {
                    Navigator.of(context).pushNamed('/allvideos');
                  },
                ),
                ShowVideos(),

                /// Health tips stream

                StreamBuilder<List<ArticlesModel>>(
                    stream: ArticlesProvider.of(context).articlesStream,
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
                      } else if (!snap.error) {
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
                                  "No article fount",
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
                                "No article fount",
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
                ShowHeading(
                  title: "Health Tips",
                  subTitle: "ALL TIPS",
                  callBack: () {
                    Navigator.of(context).pushNamed('/allhealthtip');
                  },
                ),
                ShowHealthTip(),
                StreamBuilder<List<ArticlesModel>>(builder: (context, snap) {}),
                ShowHeading(
                  title: "Yoga Guru",
                  subTitle: "ALL YOGA TIPS",
                  callBack: () {
                    Navigator.of(context).pushNamed('/allyogatip');
                  },
                ),
                ShowYogaArticles(),
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


