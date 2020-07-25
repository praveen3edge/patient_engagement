import 'package:flutter/material.dart';
import 'package:patientengagement/utils/export_utils.dart';

class ShowYogaArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTBZN3lio40xBfZkiA82vg96Tnef7zrzJ4KLg&usqp=CAU",
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
                title: Text("Yoga Tips for Beginners",style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 16,color: AppColor.blackCommon
                ),),
                subtitle: Text("As a beginner, often we equate yoga with some tough, limb-twist..",style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 13,
                ),),
              )),

            ],
          ),
        ),
      ),
    );
  }
}