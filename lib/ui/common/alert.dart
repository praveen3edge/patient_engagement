import 'package:flutter/material.dart';
import 'package:patientengagement/ui/common/custom_pop_up.dart';
import 'package:patientengagement/utils/colors.dart';

enum TypeOfAlert{

  SUCCESS,
  ERROR,
  INFO,
  WARNING,

}
class AlertData {

  TypeOfAlert alert;
  String title;
  String subtitle;
  List<Alertbutton> buttons;
  AlertData({this.alert,this.title,this.subtitle,this.buttons});

}


class Alertbutton {
  String name;
  Function callBack;
  Alertbutton({this.name, this.callBack});
}

class AlertClass extends StatefulWidget {

  AlertData alertData;

  AlertClass(this.alertData);
  @override
  _AlertClassState createState() => _AlertClassState();
}

class _AlertClassState extends State<AlertClass> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.black38.withOpacity(0.2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 600,
                width: MediaQuery.of(context).size.width - 120,
                color: generateColors(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        generateIcons(),
                        color: Colors.white,
                        size:  MediaQuery.of(context).size.width - 270,
                      ),
                      Text(widget.alertData.title,
                          style:Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.white))
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 600,
                width: MediaQuery.of(context).size.width - 120,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.alertData.subtitle,
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          List.generate(widget.alertData.buttons.length, (index) {
                            return Container(
//                            height: 50.0,
//                            width: 150.0,
                              margin: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(240, 207, 73, 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                                  border: Border.all(
                                    color: Color.fromRGBO(241, 209, 57, 1),
                                    width: 0.5,
                                  )),
                              child: Material(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                                //color: Color.fromRGBO(112, 112, 112, 1),
                                //color: Color.fromRGBO(255, 255, 255, 1),
                                color: generateColors(),

                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                                  //splashColor: AppTheme.yellowDark,
                                  //highlightColor: AppTheme.yellowLight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:10.0,bottom: 10.0,left: 30.0,right: 30.0),
                                    child: Center(
                                      child: Text(
                                        widget.alertData.buttons[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'nunitosans',
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  generateIcons(){

    switch(widget.alertData.alert){

      case TypeOfAlert.ERROR://red
        return Icons.close;
        break;
      case TypeOfAlert.INFO://blue
        return Icons.info_outline;
        break;
      case TypeOfAlert.SUCCESS://green
        return Icons.check;
        break;
      default://yellow
        return Icons.warning;
        break;

    }


  }





  generateColors(){

    switch(widget.alertData.alert){

      case TypeOfAlert.WARNING://red
        return AppColor.violet;
        break;

      default://yellow
        return AppColor.violet;
        break;

    }


  }


}

//enum TypeOfAlert{
//
//  SUCCESS,
//  ERROR,
//  INFO,
//  WARNING,
//
//}
//


void callDialog(AlertData alertModel,BuildContext context) {
  Navigator.push(
      context,
      OpenPopUp(
        widget: WillPopScope(onWillPop: () async => false, child: AlertClass(alertModel)),
      ));
}