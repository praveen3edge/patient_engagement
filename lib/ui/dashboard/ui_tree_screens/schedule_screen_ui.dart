import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patientengagement/block/buisness_logic/calender.dart';
import 'package:patientengagement/ui/common/app_bar.dart';
import 'package:patientengagement/ui/dashboard/ui_tree_screens/appointment_details.dart';
import 'package:patientengagement/ui/dashboard/ui_tree_screens/missed_appointment_details.dart';
import 'package:patientengagement/utils/colors.dart';
import 'package:intl/intl.dart';

class ScheduleVisitScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleVisitScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedMonthTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundGrey,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: new Container(
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TopBar("Schedule Visit"),
                Container(
                  color: AppColor.white,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 0, bottom: 0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: new Text(
                                DateFormat('MMM yyyy')
                                    .format(selectedMonthTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                        color: AppColor.blackCommon,
                                        fontSize: 16),
                              ),
                            ),
                            new IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 18,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedMonthTime = DateTime(
                                      selectedMonthTime.year,
                                      selectedMonthTime.month,
                                      0);
                                });

                                print("back");
                              },
                              splashColor: AppColor.grey,
                            ),
                            new IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedMonthTime = DateTime(
                                        selectedMonthTime.year,
                                        selectedMonthTime.month + 2,
                                        0);
                                  });
                                  print("forward");
                                }),
                          ],
                        ),
                      ),
                      generateMonthWidget(selectedMonthTime),

                    ],
                  ),
                ),


                SizedBox(
                  height: 0,
                ),

                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              height:10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: AppColor.violet,
                                  shape: BoxShape.circle
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: new Text("SELECTED",style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: AppColor.blackCommon,fontSize: 12
                              ),),
                            ),
                          ],
                        ),

                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              height:10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  shape: BoxShape.circle
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: new Text("MISSED",style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: AppColor.blackCommon,fontSize: 12
                              ),),
                            )
                          ],
                        ),


                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              height:10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: new Text("UPCOMING",style: Theme.of(context).textTheme.bodyText1.copyWith(
                                  color: AppColor.blackCommon,fontSize: 12
                              ),),
                            )
                          ],
                        ),




                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 32,
                ),
                new Container(
                  height: 150,
                  color: AppColor.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Theme(
                      data: ThemeData(textTheme: TextTheme()),
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: AppColor.blackCommon,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        minLines: 5,
                        maxLines: 10,
                        textAlign: TextAlign.justify,
//                  maxLength: 1000,
                        decoration: InputDecoration(
                            //

                            border: InputBorder.none,
                            hintText: 'Add notes about this appointment ...',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: AppColor.blackCommon,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(31)),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.gradientButton1,
                          AppColor.gradientButton0,
                        ],
                      )),
                  child: new Material(
                    borderRadius: BorderRadius.all(Radius.circular(31)),
                    color: Colors.transparent,
                    child: InkWell(

                      onTap: (){

                        showDialog(context: context,builder: (context){
                          return AlertDialog(
                            content: SingleChildScrollView(
                              child: Container(
                                child: Center(
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: new Text("Confirmation !",style: Theme.of(context).textTheme.headline3.copyWith(
                                          color: AppColor.blackCommon,fontSize: 16
                                        ),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: new Text("Are you sure to request for an appointment ?",style: Theme.of(context).textTheme.headline3.copyWith(
                                            color: AppColor.grey,fontSize: 16
                                        ),textAlign: TextAlign.center,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Cancel")),

                              FlatButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Ok")),

                            ],
                          );
                        });


                      },
                      borderRadius: BorderRadius.all(Radius.circular(31)),
                      splashColor: AppColor.gradientButton0,
                      child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: new Center(
                          child: new Text("Schedule visit",style: Theme.of(context).textTheme.headline4.copyWith(
                            color: AppColor.white,fontSize: 16
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generateMonthWidget(DateTime date) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        weekDaysBuilder(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: createMonthlyCalender(date),
          ),
        ),
      ],
    );
  }

  List<Widget> createMonthlyCalender(DateTime date) {
    List<DateTime> monthDate = generateDates(date);

    List<Widget> dateWidget = [];

    int index = 0;
    for (int i = 0; i < monthDate.length / 7; i++) {
      List<Widget> rowData = [];
      for (int j = 0; j < 7; j++) {
        rowData.add(CalenderSingleDate(
          date: monthDate[index],
          currentMontDate: date,
          selectedDate: this.selectedDate,
          callBack: (DateTime date){
            setState(() {
              this.selectedDate = date;
            });
          },
        ));
        index = index + 1;
      }
      dateWidget.add(new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rowData,
      ));
    }

    return dateWidget;
  }

  Widget weekDaysBuilder() {
    List<String> dayList = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return Container(
      padding: EdgeInsets.only(bottom: 4.0),
      color: Color(0XFFF9F9F9),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(dayList.length, (index) {
            return generateDayRow(dayList[index]);
          }),
        ),
      ),
    );
  }

  Widget generateDayRow(String day) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Container(
          child: Stack(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    child: Container(
//                    color: Colors.redAccent,
                      child: Center(
                        child: new Text(
                          "$day",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontWeight: day == "Sun"
                                    ? FontWeight.w800
                                    : FontWeight.bold,
                                fontSize: 12.0,
                              ),
                        ),
                      ),
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

class CalenderSingleDate extends StatefulWidget {
  DateTime date;
  DateTime currentMontDate;
  DateTime selectedDate;
  Function callBack;
  CalenderSingleDate({this.date, this.currentMontDate, this.selectedDate,this.callBack});

  @override
  _CalenderSingleDateState createState() => _CalenderSingleDateState();
}

class _CalenderSingleDateState extends State<CalenderSingleDate> {

  DateTime missed = DateTime(2020,7,08);
  DateTime upcoming = DateTime(2020,7,31);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.2,
        child: GestureDetector(
          onTap: (){
            if(checkUpcomingDate()){
              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                return AppointmentScreen(widget.date);
              }));
            }
            else if(checkMissedDate()){
              Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                return MissedAppointmentDetails(widget.date);
              }));

            }
            else {
              DateTime now = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
              DateTime thisDate = DateTime(widget.date.year,widget.date.month,widget.date.day);
              if(!thisDate.isBefore(now)){
                this.widget.callBack(this.widget.date);
              }
              else{
                showDialog(context: context,builder: (context){
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: Container(
                        child: Center(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: new Text("Sorry !",style: Theme.of(context).textTheme.headline3.copyWith(
                                    color: AppColor.blackCommon,fontSize: 16
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: new Text("You can only select a date from current date ",style: Theme.of(context).textTheme.headline3.copyWith(
                                    color: AppColor.grey,fontSize: 16
                                ),textAlign: TextAlign.center,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    actions: <Widget>[


                      FlatButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Ok")),

                    ],
                  );
                });
              }

            }

          },
          child:checkThisMonth()? Padding(
            padding: EdgeInsets.all(2),
            child: new Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: checkSelectedDate() || checkUpcomingDate() || checkMissedDate()?AppColor.grey.withOpacity(0.5):Colors.transparent,
                        spreadRadius: 1,
                        blurRadius: 2
                    )
                  ],
                  color: checkUpcomingDate()?Colors.deepOrange:checkMissedDate()?Colors.orangeAccent:checkSelectedDate()
                      ? AppColor.violet
                      : AppColor.white),
              child: Center(
                child: CreateDate(
                    widget.date,
                    checkSelectedDate() || checkUpcomingDate() || checkMissedDate()
                        ? AppColor.white
                        : AppColor.blackCommon,
                    checkThisMonth()),
              ),
            ),
          ):Padding(
            padding: EdgeInsets.all(2),
            child: new Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                color: Colors.white
                  ),
              child: Center(
                child: CreateDate(
                    widget.date,
                    AppColor.blackCommon,
                    checkThisMonth()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool checkThisMonth(){
    return ((widget.date.year == widget.currentMontDate.year) &&
        (widget.date.month == widget.currentMontDate.month));
  }

  bool checkMissedDate(){
    return((widget.date.year == missed.year) &&
        (widget.date.month == missed.month) &&
        (widget.date.day == missed.day));
  }
  bool checkSelectedDate(){
    return ((widget.date.year == widget.selectedDate.year) &&
        (widget.date.month == widget.selectedDate.month) &&
        (widget.date.day == widget.selectedDate.day));
  }

  bool checkUpcomingDate(){
    return ((widget.date.year == upcoming.year) &&
        (widget.date.month == upcoming.month) &&
        (widget.date.day == upcoming.day));
  }


}

class CreateDate extends StatelessWidget {
  DateTime date;
  Color textColor;
  bool show;
  CreateDate(this.date, this.textColor, this.show);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          child: Center(
            child: new Text(
              DateFormat('dd').format(date),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: show ? textColor : textColor.withOpacity(0.1),
              ),
//              style: Theme.of(context).textTheme.headline3.copyWith(
////                  fontWeight: FontWeight.normal,
////                  fontSize: 16,
//                  color: show
//                      ? AppColor.blackCommon.withOpacity(1.0)
//                      : AppColor.blackCommon.withOpacity(0.2)),
            ),
          ),
        ),
      ),
    );
  }
}
