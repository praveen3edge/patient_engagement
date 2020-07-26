import 'package:flutter/material.dart';
import 'package:patientengagement/models/articles_model.dart';
import 'package:patientengagement/ui/learn/read/article.dart';
import 'package:patientengagement/utils/export_utils.dart';

class ShowHealthTip extends StatelessWidget {
  ArticlesModel data;
  ShowHealthTip(this.data);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
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
            padding: const EdgeInsets.only(top: 8,bottom: 8),
            child: ListTile(
              title: Text(data.articleName,style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 14,color: AppColor.blackCommon
              ),),
              subtitle: Text(
                data.articleDescription,textAlign: TextAlign.justify,style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 12,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}