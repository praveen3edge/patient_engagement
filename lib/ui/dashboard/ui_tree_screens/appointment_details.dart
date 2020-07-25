import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patientengagement/utils/colors.dart';
import 'package:intl/intl.dart';

class AppointmentScreen extends StatelessWidget {
  DateTime selected;
  AppointmentScreen(this.selected);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 20, right: 30.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    alignment: Alignment.topRight,
                    child: Text(
                      "Close",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppColor.violetText,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'nunitosans',
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
                child: Text(
                  "Your visit has been scheduled",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                    color: AppColor.blackCommon,fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 5),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svg/appointment.svg",
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        "Date",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: AppColor.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Text(
                        DateFormat('EEEE , dd LLL yyyy').format(selected),
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: new Text(
                        "Time",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: AppColor.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: new Text(
                        DateFormat('hh:mm a').format(selected),
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Text(
                        "Location ",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: AppColor.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: new Text(
                        "Moolchand Hospital,\nLala lajpat Marg , New Delhi",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        "Open in map ",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: AppColor.violet,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
//
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          child: Center(
                            child: new Text(
                              "Cancel this appointment",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: AppColor.violet,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
//
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Container(
                          child: Center(
                            child: new Text(
                              "Contact us",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: AppColor.violet,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
