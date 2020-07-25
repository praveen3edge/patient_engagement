import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/avd.dart';
import 'package:patientengagement/block/dashboard_block.dart';
import 'package:patientengagement/routes/routes.dart';
import 'package:patientengagement/utils/export_utils.dart';
import 'package:patientengagement/ui/export.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert';



void main() {

  final Xml2Json xml2Json = Xml2Json();

  var xmlString = '''<?xml version="1.0"?>
    <site>
      <tut>
        <id>tut_01</id>
        <author>bezKoder</author>
        <title>Programming Tut#1</title>
        <publish_date>2020-8-21</publish_date>
        <description>Tut#1 Description</description>
      </tut>
      <tut>
        <id>tut_02</id>
        <author>zKoder</author>
        <title>Software Dev Tut#2</title>
        <publish_date>2020-12-18</publish_date>
        <description>Tut#2 Description</description>
      </tut>
    </site>''';

  xml2Json.parse(xmlString);
  var jsonString = xml2Json.toParker();

  print(jsonString);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  DashboardBlock dashboardBlock = DashboardBlock();
  static final navKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return DashboardProvider(
      dataBlock: dashboardBlock,
      child: MaterialApp(
        key: navKey,
        title: 'Patient Engagement',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:textTheme
        ),
//        home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: '/dashboard',
        onGenerateRoute: (RouteSettings settings) {
//          DashboardProvider.of(context).changePath(settings.name);
          return pageRouteGenerator(settings);
        },
//        builder: (BuildContext context , Widget child){
//          return PatientEngagementBuilder(child);
//        },
      ),
    );
  }
}


class PatientEngagementBuilder extends StatefulWidget{
  Widget child;
  PatientEngagementBuilder(this.child);
  @override
  _PatientEngagementBuilderState createState() => _PatientEngagementBuilderState();
}

class _PatientEngagementBuilderState extends State<PatientEngagementBuilder> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async=>false,
      child: Scaffold(
        body: widget.child,
//        bottomNavigationBar:PatientEngagementBottomAppBar(),
      ),
    );
  }




}



