import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patientengagement/block/dashboard_block.dart';
import 'package:patientengagement/models/diary_models.dart';
import 'package:patientengagement/ui/common/alert.dart';
import 'package:patientengagement/ui/common/common_class.dart';
import 'package:patientengagement/ui/common/diary_components.dart';
import 'package:patientengagement/utils/colors.dart';
import 'package:intl/intl.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DashboardProvider.of(context).changePath('/dashboard');
    });
  }

  @override
  Widget build(BuildContext context) {
    DashboardProvider.of(context).changePath('/dashboard');

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              ShowHeading(
                title: "Diary",
                subTitle: "SEE MORE",
                callBack: (){
                  Navigator.of(context).pushNamed('/seeallmedications');
                },//scheculevisit
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(
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
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    ShowMedicalReportForBasis(DayModel.fromJson(x)),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(
                              child: new Text("Add notes to your medical diary",style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: AppColor.violet,fontSize: 14
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ShowHeading(
                title: "Upcoming Visits",
                subTitle: "SCHEDULE VISITS",
                callBack: (){
                  Navigator.of(context).pushNamed('/scheculevisit');
                },//
              ),

              AppointmentCard(),



            ],
          ),
        ),
      ),
    );
  }

  void open() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
      );
    }));
  }
}




//class ShowMedicalReportForBasis extends StatefulWidget{
//  @override
//  _ShowMedicalReportForBasisState createState() => _ShowMedicalReportForBasisState();
//}
//
//class _ShowMedicalReportForBasisState extends State<ShowMedicalReportForBasis> {
//  @override
//  Widget build(BuildContext context) {
//    return new Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//
//        Padding(
//          padding: const EdgeInsets.only(left: 8.0),
//          child: new Text("Morning",style: Theme.of(context).textTheme.headline4.copyWith(
//            color: AppColor.grey,fontSize: 14
//          ),),
//        ),
//
//        ShowMedicationCheck(),
//        ShowMedicationCheck(),
//
//      ],
//    );
//  }
//}
//
//
//class ShowMedicationCheck extends StatefulWidget {
//  @override
//  _ShowMedicationCheckState createState() => _ShowMedicationCheckState();
//}
//
//class _ShowMedicationCheckState extends State<ShowMedicationCheck> {
//  bool selected = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.only(left: 4,right: 8),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          new Checkbox(
//            checkColor: AppColor.violet,
//              activeColor: Colors.white,
//              value: selected,
//              onChanged: (val) {
//                setState(() {
//                  this.selected = val;
//                });
//              }),
//          Expanded(
//            child: new Text("Medicine name 1",style: Theme.of(context).textTheme.bodyText2.copyWith(
//              color: selected?AppColor.grey:Colors.black,fontSize: 14,fontWeight: FontWeight.bold
//            ),),
//          ),
//          new Text(selected?"${DateFormat.jm().format(DateTime.now())}":"",style: Theme.of(context).textTheme.bodyText2.copyWith(
//              color: selected?Colors.grey:Colors.transparent,fontSize: 12
//          ),),
//        ],
//      ),
//    );
//  }
//}


class AppointmentCard extends StatefulWidget{
  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
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
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Text("Date",style: Theme.of(context).textTheme.headline4.copyWith(
                    color: AppColor.grey,fontSize: 12
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: new Text(DateFormat('EEE , dd LLL yyyy').format(DateTime.now().add(Duration(days: 10))),style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,fontSize: 14
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Text("Time",style: Theme.of(context).textTheme.headline4.copyWith(
                    color: AppColor.grey,fontSize: 12
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: new Text(DateFormat('hh:mm a').format(DateTime.now().add(Duration(days: 10))),style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,fontSize: 14
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Text("Location ",style: Theme.of(context).textTheme.headline4.copyWith(
                    color: AppColor.grey,fontSize: 12
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: new Text("Moolchand Hospital,\nLala lajpat Marg , New Delhi",style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.black,fontSize: 14
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Text("Open in map ",style: Theme.of(context).textTheme.headline4.copyWith(
                    color: AppColor.violet,fontSize: 12
                ),),
              ),

              Divider(),

              GestureDetector(
                onTap: (){
//
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    child: Center(
                      child: new Text("Cancel this appointment",style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: AppColor.violet,fontSize: 14
                      ),),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
