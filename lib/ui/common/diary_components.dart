import 'package:flutter/material.dart';
import 'package:patientengagement/models/diary_models.dart';
import 'package:intl/intl.dart';
import 'package:patientengagement/utils/colors.dart';



class ShowMedicalReportForBasis extends StatefulWidget{
  DayModel daymodel ;
  ShowMedicalReportForBasis(this.daymodel);
  @override
  _ShowMedicalReportForBasisState createState() => _ShowMedicalReportForBasisState();
}

class _ShowMedicalReportForBasisState extends State<ShowMedicalReportForBasis> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        ...List.generate(widget.daymodel.partOfday.length, (index) =>Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(widget.daymodel.partOfday[index].heading,style: Theme.of(context).textTheme.headline4.copyWith(
                  color: AppColor.grey,fontSize: 14
              ),),
              ShowMedicationCheck(widget.daymodel.partOfday[index].medicalModel),
              SizedBox(height: 8,),
            ],
          ),
        ),),
      ],
    );
  }
}


class ShowMedicationCheck extends StatefulWidget {

  List<MedicationModel> medicationModel;
  ShowMedicationCheck(this.medicationModel);
  @override
  _ShowMedicationCheckState createState() => _ShowMedicationCheckState();
}

class _ShowMedicationCheckState extends State<ShowMedicationCheck> {
  bool selected = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...List.generate(this.widget.medicationModel.length, (index) =>  Padding(
          padding: const EdgeInsets.only(left: 2,right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Checkbox(
                  checkColor: AppColor.violet,
                  activeColor: Colors.white,
                  value: this.widget.medicationModel[index].selected,
                  onChanged: (val) {
                    print(this.widget.medicationModel[index].title);
                    setState(() {
                      this.widget.medicationModel[index].selected = val;
                      this.widget.medicationModel[index].time = DateTime.now();
                    });
                  }),
              Expanded(
                child: new Text(this.widget.medicationModel[index].title,style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: this.widget.medicationModel[index].selected?AppColor.grey:Colors.black,fontSize: 14,fontWeight: FontWeight.bold
                ),),
              ),
              new Text(this.widget.medicationModel[index].selected?"${DateFormat.jm().format(this.widget.medicationModel[index].time)}":"",style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: this.widget.medicationModel[index].selected?Colors.grey:Colors.transparent,fontSize: 12
              ),),
            ],
          ),
        ),),
      ],
    );
  }
}