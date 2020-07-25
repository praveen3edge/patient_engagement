import 'package:flutter/material.dart';
import 'package:patientengagement/ui/common/app_bar.dart';
import 'package:patientengagement/ui/common/common_export.dart';


class ShowAllYogaTips extends StatelessWidget{
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
//              Container(
//                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: (){
//                      Navigator.pop(context);
//                    }),
//                    ShowHeading(title: "All Yoga Tips",),
//                  ],
//                ),
//              ),
            TopBar("All yoga tips"),
              SizedBox(height: 20,),



              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ...List.generate(10, (index) =>ShowYogaArticles()),
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