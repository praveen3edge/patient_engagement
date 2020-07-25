import 'package:patientengagement/api/article_api.dart';
import 'package:patientengagement/models/articles_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class ArticlesBlock {
  final _articles = BehaviorSubject<List<ArticlesModel>>();
  Stream<List<ArticlesModel>> get articlesStream => _articles.stream;

  final _healthTip = BehaviorSubject<List<ArticlesModel>>();
  Stream<List<ArticlesModel>> get healthTipStream => _healthTip.stream;

  final _yogaTip = BehaviorSubject<List<ArticlesModel>>();
  Stream<List<ArticlesModel>> get yogaTipStream => _yogaTip.stream;

  final _exerciseTip = BehaviorSubject<List<ArticlesModel>>();
  Stream<List<ArticlesModel>> get exerciseTipStream => _exerciseTip.stream;

  final _videoArticle = BehaviorSubject<List<VideoModel>>();
  Stream<List<VideoModel>> get videoArticleStream => _videoArticle.stream;

  getInitialArticleData() async {
    var responses = await Future.wait(
        [getArticle(), getYoga(), getExercise(), getHealthTip(), getVideos()]);

    for (int i = 0; i < responses.length; i++) {
      switch (i) {
        case 0:
          setArticle(responses[i]);
          break;
        case 1:
          setYogaTip(responses[i]);
          break;
        case 2:
          setExerciseTip(responses[i]);
          break;
        case 3:
          setHealthTip(responses[i]);
          break;
        case 4:
          setVideo(responses[i]);
          break;
      }
    }

    return true;
  }

  void setArticle(dynamic data) {
    if (data is ArticlesApiResponse) {
      this._articles.add(data.articles);
    } else {
      this._articles.addError(data);
    }
  }

  void setHealthTip(dynamic data) {
    if (data is ArticlesApiResponse) {
      this._healthTip.add(data.articles);
    } else {
      this._healthTip.addError(data);
    }
  }

  void setYogaTip(dynamic data) {
    if (data is ArticlesApiResponse) {
      this._yogaTip.add(data.articles);
    } else {
      this._yogaTip.addError(data);
    }
  }

  void setExerciseTip(dynamic data) {
    if (data is ArticlesApiResponse) {
      this._exerciseTip.add(data.articles);
    } else {
      this._exerciseTip.addError(data);
    }
  }

  void setVideo(dynamic data) {
    if (data is VideosApiResponse) {
      this._videoArticle.add(data.articles);
    } else {
      this._exerciseTip.addError(data);
    }
  }
}

class ArticlesProvider extends InheritedWidget {
  final ArticlesBlock block;

  ArticlesProvider({Key key, @required ArticlesBlock dataBlock, Widget child})
      : assert(dataBlock != null),
        block = dataBlock,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ArticlesBlock of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<ArticlesProvider>()).block;
}
