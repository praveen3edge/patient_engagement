import 'package:intl/intl.dart';

class PartOfDay{

  String heading;
  List<MedicationModel> medicalModel;

  PartOfDay({this.heading,this.medicalModel});

  factory PartOfDay.fromJson(Map<String, dynamic> data){
    return PartOfDay(
        heading: data['heading'],
        medicalModel: data['medication_list'] != null ?
        List.generate(data["medication_list"].length,
                (index) => MedicationModel.fromJson(data["medication_list"][index]))
            : []

    );
  }

  Map<String, dynamic> toJson(){

    final Map<String , dynamic> data = new Map<String , dynamic>();

    data['heading'] = this.heading;
    data['medication_list'] = this.medicalModel  != null ? this.medicalModel.map((i) => i.toJson()).toList() : null;
    return data;
  }

}


class MedicationModel{
  bool selected;
  String title;
  DateTime time;

  MedicationModel({this.selected,this.title,this.time});
  factory MedicationModel.fromJson(Map<String, dynamic> data){

    return MedicationModel(

      selected: data['taken'],
      time: data['time'] != null?DateTime.parse(data['time']):null,
      title: data['name_of_medicine'],
    );
  }
  Map<String, dynamic> toJson(){

    final Map<String , dynamic> data = new Map<String , dynamic>();

    data['taken'] = this.selected;
    data['time'] = this.time;
    data['name_of_medicine'] = this.title;
    return data;
  }



}

class DayModel{

  DateTime date;
  List<PartOfDay> partOfday;

  DayModel({this.date,this.partOfday});

  factory DayModel.fromJson(var data) {
    return DayModel(
        date:
        data["date"] != null ? DateTime.parse(data["date"]) : null,


        partOfday: data["part_of_day"] != null
            ? List.generate(data["part_of_day"].length,
                (index) => PartOfDay.fromJson(data["part_of_day"][index]))
            : []);

  }
  Map<String, dynamic> toJson(){

    final Map<String , dynamic> data = new Map<String , dynamic>();

    data['date'] = this.date;
    data['partOfday'] = this.partOfday  != null ? this.partOfday.map((i) => i.toJson()).toList() : null;
    return data;
  }

}

var x = {
  "status":"success",
  "date":"2020-07-18",
  "part_of_day":[
    {
      "heading":"Morning",
      "medication_list":[
        {
          "taken":true,
          "name_of_medicine":"Paracetamol",
          "time":"2020-07-18 09:30:00"
        },
        {
          "taken":false,
          "name_of_medicine":"Humulin and Novolin",
          "time":null
        }
      ]
    },
    {
      "heading":"AfterNoon",
      "medication_list":[
        {
          "taken":true,
          "name_of_medicine":"Paracetamol",
          "time":"2020-07-18 14:30:00"
        },
        {
          "taken":false,
          "name_of_medicine":"Humulin and Novolin",
          "time":null
        }
      ]
    },
    {
      "heading":"Evening",
      "medication_list":[
        {
          "taken":true,
          "name_of_medicine":"Paracetamol",
          "time":"2020-07-18 21:30:00"
        },
        {
          "taken":false,
          "name_of_medicine":"Humulin and Novolin",
          "time":null
        }
      ]
    },
  ]
};