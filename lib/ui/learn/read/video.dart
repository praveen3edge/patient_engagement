import 'package:flutter/material.dart';
import 'package:patientengagement/models/articles_model.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:patientengagement/ui/common/common_class.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:patientengagement/utils/colors.dart';

class PlayVideoArticle extends StatefulWidget{
  VideoModel data;
  PlayVideoArticle(this.data);
  @override
  _PlayVideoArticleState createState() => _PlayVideoArticleState();
}

class _PlayVideoArticleState extends State<PlayVideoArticle> {
  String kHtml ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kHtml = '''
    <iframe src="${widget.data.videoContent}" width="560" height="315"></iframe>
      ''';
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
              Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
                      Navigator.pop(context);
                    }),
                    ShowHeading(title: "Healthy Habbits: 10 ...",),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HtmlWidget(
                        kHtml,
                        webView: true,

                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.data.videoName + " - "+ widget.data.videoAuthor,style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 16,color: AppColor.blackCommon
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(

                          widget.data.videoDescription,style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 14,
                        ),),
                      ),

                    ],
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
