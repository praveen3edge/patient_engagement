import 'package:flutter/material.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:patientengagement/ui/common/common_class.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:patientengagement/utils/colors.dart';

class PlayVideoArticle extends StatefulWidget{
  @override
  _PlayVideoArticleState createState() => _PlayVideoArticleState();
}

class _PlayVideoArticleState extends State<PlayVideoArticle> {
  String kHtml = '''
    <iframe src="https://www.youtube.com/embed/6ajmuRg2o3Q" width="560" height="315"></iframe>
      ''';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    children: <Widget>[
                      HtmlWidget(
                        kHtml,
                        webView: true,

                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("HEALTHY HABITS: 10 daily habits that may change your life",style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 16,color: AppColor.blackCommon
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('''Your attitude determines your altitude. "Succesful people don't just drift off to the top. Getting there requires focused action, personal discipline and lots of energy every day to make things happen," says American author and entrepreneur Jack Canfield. And he couldn't be more accurate.So, don't let old habits hold you back. Start building these simple yet essential habits for a happier and more productive life:''',style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 14,
                        ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('''Your attitude determines your altitude. "Succesful people don't just drift off to the top. Getting there requires focused action, personal discipline and lots of energy every day to make things happen," says American author and entrepreneur Jack Canfield. And he couldn't be more accurate.So, don't let old habits hold you back. Start building these simple yet essential habits for a happier and more productive life:''',style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 14,
                        ),),
                      )
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
