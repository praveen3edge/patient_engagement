import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patientengagement/block/dashboard_block.dart';
import 'package:patientengagement/ui/common/common_class.dart';
import 'package:patientengagement/utils/colors.dart';

class EmergencyNumbers{
  String name;
  String number;
  EmergencyNumbers(this.name,this.number);
}


class ContactUi extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<ContactUi> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    WidgetsBinding.instance.addObserver(this);
//    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      DashboardProvider.of(context).changePath('/dashboard');
//    });
  }


  List<String> doctor = [
    "Dr. Shubha"," Dr. Srinivas", "Dr. Akrithi"
  ];
  
  List<EmergencyNumbers> emergency = [
    EmergencyNumbers("National Emergency Number ","112"),
    EmergencyNumbers("Ambulance","102"),
    EmergencyNumbers("Apollo Indraprastha hospita","011-26925858"),

  ];

  @override
  Widget build(BuildContext context) {
    DashboardProvider.of(context).changePath('/contact');

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShowHeading(
                title: "Contact Doctor",
                subTitle: "All doc",
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
                        ...List.generate(doctor.length, (index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ShowDoctor(DoctorModel(doctor[index])),
                              Divider(),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              ShowHeading(
                title: "Emergency Contacts",
                subTitle: "ADD CONTACT",
                callBack: () {
                  Navigator.of(context).pushNamed('/addcontact');
                },
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
                    padding: const EdgeInsets.all(0.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ...List.generate(emergency.length, (index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ShowEmergencyContact(EmergencyContactModel(
                                  emergency[index].name, emergency[index].number)),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Divider(),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              ShowHeading(
                title: "Call Cab",
                subTitle: "Add Contacts",
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
                    padding: const EdgeInsets.all(0.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ...List.generate(1, (index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ShowEmergencyContact(EmergencyContactModel(
                                  "South Delhi cab service",
                                  "+91 967843445863")),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Divider(),
                              ),
                            ],
                          );
                        }),
                      ],
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

  void open() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
      );
    }));
  }
}

class DoctorModel {
  String name;
  DoctorModel(this.name);
}

class ShowDoctor extends StatelessWidget {
  DoctorModel data;
  ShowDoctor(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 55,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: new Text(
              "${data.name}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/svg/call.svg",
                      color: AppColor.violet,
                      height: 30,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: SvgPicture.asset(
                      "assets/svg/chat.svg",
                      color: AppColor.violet,
                      height: 40,
                    ),
                    onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyContactModel {
  String name;
  String number;
  EmergencyContactModel(this.name, this.number);
}

class ShowEmergencyContact extends StatelessWidget {
  EmergencyContactModel data;
  ShowEmergencyContact(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListTile(
          title: new Text(
            "${data.name}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          subtitle: new Text(
            "${data.number}",
            style: TextStyle(
                color: AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          trailing: Container(
//              decoration: BoxDecoration(
//                border: Border.all(color: AppColor.violet, width: 1),
//                borderRadius: BorderRadius.all(Radius.circular(30)),
//              ),
              height: 35,
              width: 35,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                    child: SvgPicture.asset(
                  "assets/svg/call.svg",
                  color: AppColor.violet,
                  height: 30,
                )),
              )),
        ),
      ),
    );
  }
}
