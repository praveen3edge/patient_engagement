import 'package:flutter/material.dart';
import 'package:patientengagement/models/articles_model.dart';
import 'package:patientengagement/ui/learn/read/article.dart';
import 'package:patientengagement/ui/learn/read/video.dart';
import 'package:patientengagement/utils/export_utils.dart';

class ShowArticles extends StatelessWidget {
  ArticlesModel data;
  ShowArticles(this.data);
  @override
  Widget build(BuildContext context) {
//    data.articleDescription = data.articleDescription+" https:// images. medicinenet.com /images/article/ main_image/healthy-living2.jpg";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
//          Navigator.of(context).pushNamed('/viewarticle');
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return ReadArticle(data.articleContent,data.articleName);
        }));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColor.grey.withOpacity(0.1),
                    offset: Offset(0, 0),
                    blurRadius: 2,
                    spreadRadius: 1)
              ],
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                            data.articleImage,
                          ),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.grey.withOpacity(0.1),
                            offset: Offset(0, 0),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),

                Expanded(child: ListTile(
                  title: Text(data.articleName,style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: 16,color: AppColor.blackCommon
                  ),),
                  subtitle: Text(data.articleDescription.length < 80?data.articleDescription:data.articleDescription.replaceRange(77, data.articleDescription.length, "..."),style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 13,
                  ),),
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowVideos extends StatelessWidget {
  VideoModel data;
  ShowVideos(this.data);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
//          Navigator.of(context).pushNamed('/playvideo');

        Navigator.push(context,MaterialPageRoute(builder: (context){
          return PlayVideoArticle(data);
        }));

        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColor.grey.withOpacity(0.1),
                    offset: Offset(0, 0),
                    blurRadius: 2,
                    spreadRadius: 1)
              ],
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                            data.videoImage,
                          ),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: AppColor.grey.withOpacity(0.1),
                            offset: Offset(0, 0),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Center(
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Icon(Icons.play_arrow,color: Colors.white,size: 20,),
                    ),
                  ),
                ),

                Expanded(child: ListTile(
                  title: Text(data.videoName+" - "+data.videoAuthor,style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: 14,color: AppColor.blackCommon
                  ),),
                  subtitle: Text(data.videoDescription,style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 12,
                  ),),
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}