import 'package:flutter/material.dart';
import 'package:patientengagement/models/articles_model.dart';
import 'package:patientengagement/utils/export_utils.dart';

class ShowArticles extends StatelessWidget {
  ArticlesModel data;
  ShowArticles(this.data);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/viewarticle');
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
                            "https://images.medicinenet.com/images/article/main_image/healthy-living2.jpg",
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
                  title: Text("What is healthy living?",style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: 16,color: AppColor.blackCommon
                  ),),
                  subtitle: Text("Healthy living , To most people means both physical and mental health ...",style: Theme.of(context).textTheme.headline4.copyWith(
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/playvideo');
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
                            "http://loseweightexperts.com/wp-content/uploads/2018/09/0-657.jpg",
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
                  title: Text("HEALTHY HABITS: 10 daily habits that may change your life",style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: 14,color: AppColor.blackCommon
                  ),),
                  subtitle: Text("10 daily habits that have helped not only my physical he..",style: Theme.of(context).textTheme.headline4.copyWith(
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