import 'package:flutter/material.dart';
import 'package:patientengagement/block/dashboard_block.dart';
import 'package:patientengagement/ui/common/common_class.dart';
import 'package:patientengagement/ui/contacts/contact_ui.dart';
import 'package:patientengagement/ui/dashboard/main_ui.dart';
import 'package:patientengagement/ui/learn/learn_ui.dart';


class MainRouterClass extends StatefulWidget{
  @override
  _MainRouterClassState createState() => _MainRouterClassState();
}

class _MainRouterClassState extends State<MainRouterClass> with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin,WidgetsBindingObserver{

  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addListener(() {
//        int index = 0;
//        index = controller.index;
//        print(index);
//        switch(index){
//          case 0:
//            DashboardProvider.of(context).changePath('/dashboard');
//            break;
//          case 1:
//            DashboardProvider.of(context).changePath('/visits');
//            break;
//          default:
//            DashboardProvider.of(context).changePath('/learn');
//            break;
//        }

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
          Dashboard(),
          ContactUi(),
          LearnUi(),
        ]),
        bottomNavigationBar: PatientEngagementBottomAppBar(this.controller),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}