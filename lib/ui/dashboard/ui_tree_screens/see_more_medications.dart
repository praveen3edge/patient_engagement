import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patientengagement/block/buisness_logic/calender.dart';
import 'package:patientengagement/models/diary_models.dart';
import 'package:patientengagement/ui/common/app_bar.dart';
import 'package:patientengagement/ui/common/diary_components.dart';
import 'package:patientengagement/utils/colors.dart';
import 'package:intl/intl.dart';

class SeeMoreMedications extends StatefulWidget {
  @override
  _SeeMoreMedicationsState createState() => _SeeMoreMedicationsState();
}

class _SeeMoreMedicationsState extends State<SeeMoreMedications> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TopBar("Diary"),
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
                                DateFormat('MMM yyyy').format(selectedMonthTime),
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
                                  selectedMonthTime = DateTime(selectedMonthTime.year,selectedMonthTime.month,0);
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
                                    selectedMonthTime = DateTime(selectedMonthTime.year,selectedMonthTime.month + 2,0);
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
                SizedBox(height: 16,),

                Container(color: Colors.white,child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ShowMedicalReportForBasis(DayModel.fromJson(x)),
                )),

                SizedBox(height: 32,),
                new Container(
                  height: 150,
                  color: AppColor.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Theme(
                      data: ThemeData(
                        textTheme: TextTheme(

                        )
                      ),
                      child: TextField(
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: AppColor.blackCommon,fontSize: 16,fontWeight: FontWeight.normal
                        ),
                        minLines: 5,
                        maxLines: 10,
                        textAlign: TextAlign.justify,
//                  maxLength: 1000,
                        decoration: InputDecoration( //

                          border: InputBorder.none,
                          hintText: 'Add notes to your medical dairy ...',
                          hintStyle:  Theme.of(context).textTheme.bodyText1.copyWith(
                          color: AppColor.blackCommon,fontSize: 16,fontWeight: FontWeight.normal
                        )
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 32,),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset("assets/svg/patient_diary.svg",height: 100),
                  ],
                ),

                SizedBox(height: 32,),



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
              this.selectedDate= date;
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.2,
        child: GestureDetector(
          onTap: (){
//            DateTime now = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
//            DateTime thisDate = DateTime(widget.date.year,widget.date.month,widget.date.day);
            this.widget.callBack(this.widget.date);

          },
          child: Padding(
            padding: EdgeInsets.all(2),
            child: new Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: ((widget.date.year == widget.selectedDate.year) &&
                          (widget.date.month == widget.selectedDate.month) &&
                          (widget.date.day == widget.selectedDate.day))?AppColor.grey.withOpacity(0.5):Colors.transparent,
                      spreadRadius: 1,
                      blurRadius: 3
                    )
                  ],
                  color: ((widget.date.year == widget.selectedDate.year) &&
                          (widget.date.month == widget.selectedDate.month) &&
                          (widget.date.day == widget.selectedDate.day))
                      ? AppColor.violet
                      : AppColor.white),
              child: Center(
                child: CreateDate(
                    widget.date,
                    ((widget.date.year == widget.selectedDate.year) &&
                            (widget.date.month == widget.selectedDate.month) &&
                            (widget.date.day == widget.selectedDate.day))
                        ? AppColor.white
                        : AppColor.blackCommon,
                    ((widget.date.year == widget.currentMontDate.year) &&
                        (widget.date.month == widget.currentMontDate.month))),
              ),
            ),
          ),
        ),
      ),
    );
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
