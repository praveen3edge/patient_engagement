import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/avd.dart';
import 'package:patientengagement/block/dashboard_block.dart';
import 'package:patientengagement/utils/export_utils.dart';

class PatientEngagementBottomAppBar extends StatefulWidget {
  TabController controller;
  PatientEngagementBottomAppBar(this.controller);
  @override
  _PatientEngagementBottomAppBarState createState() =>
      _PatientEngagementBottomAppBarState();
}

class _PatientEngagementBottomAppBarState
    extends State<PatientEngagementBottomAppBar> {

  int index = 0;


  @override
  Widget build(BuildContext context) {
//    return BottomAppBar();
    return StreamBuilder<String>(
      stream: DashboardProvider.of(context).pathStream,
      builder: (context, snap) {
        print(snap.data.toString());
        return BottomAppBar(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 3
                )
              ]
            ),
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          index = 0;
                          widget.controller.animateTo(0,duration: Duration(seconds: 1),curve: Curves.linear);
                        });
//                        widget.controller.animateTo(0,duration: Duration(seconds: 1),curve: Curves.linear);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.string(
                            SvgData.summary,
                            height: 30,
                            color: index == 0
                                ? AppColor.violet
                                : AppColor.grey,
                          ),
                          Text(
                            "DASHBOARD",
                            style: Theme.of(context).textTheme.headline5.copyWith(
                                color: index == 0
                                    ? AppColor.violet
                                    : AppColor.grey,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          index = 1;
                          widget.controller.animateTo(1,duration: Duration(seconds: 1),curve: Curves.linear);
                        });
//                        widget.controller.animateTo(1,duration: Duration(seconds: 1),curve: Curves.linear);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/svg/phone.svg",
                            height: 30,
                            color: index == 1
                                ? AppColor.violet
                                : AppColor.grey,
                          ),
                          Text(
                            "CONTACT",
                            style: Theme.of(context).textTheme.headline5.copyWith(
                                color: index == 1
                                    ? AppColor.violet
                                    : AppColor.grey,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          index = 2;
                          widget.controller.animateTo(2,duration: Duration(seconds: 1),curve: Curves.linear);
                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.string(
                            SvgData.learn,
                            height: 30,
                            color: index == 2
                                ? AppColor.violet
                                : AppColor.grey,
                          ),
                          Text(
                            "LEARN",
                            style: Theme.of(context).textTheme.headline5.copyWith(
                                color: index == 2
                                    ? AppColor.violet
                                    : AppColor.grey,
                                fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShowHeading extends StatefulWidget {
  String title;
  String subTitle;
  Function callBack;

  ShowHeading({this.title, this.subTitle, this.callBack});

  @override
  _ShowHeadingState createState() => _ShowHeadingState();
}

class _ShowHeadingState extends State<ShowHeading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 0.0,bottom: 0),
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text("${widget.title}",style: Theme.of(context).textTheme.headline1.copyWith(
              color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700
            ),),
            (widget.callBack == null)
                ? Container()
                : Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: GestureDetector(child: Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: Container(
                      height: 40,
//                      color: Colors.red,
                      child: Center(
                        child: Text("${widget.subTitle}",style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: AppColor.violetText,fontSize: 12,fontWeight: FontWeight.bold
            ),),
                      ),
                    ),
                  ),onTap: (){
                    widget.callBack();
            },),
                ),
          ],
        ),
      ),
    );
  }
}
