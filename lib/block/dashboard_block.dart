import 'package:patientengagement/api/auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class DashboardBlock{


  final _path = BehaviorSubject<String>();
  Stream<String> get pathStream => _path.stream;
  String currentPath = '/dashboard';




  void changePath(String path){
    currentPath = path;
    _path.add(path);
  }


  /// login

  final _auth = BehaviorSubject<String>();
  Stream<String> get authStream => _auth.stream;


  Future<dynamic> callApiLogin(String email , String password) async{

    var body = {
      "username" : email,
      "password" : password
    };

    var response = await login(body);
    return response;

  }





  // height and width ratio

  double heightRatio = 1.0; // 1.2
  double widthRatio = 1.0;

  void setHeightAndWidthRatio(BuildContext context) {
    this.heightRatio = _getHeight(context);
    this.widthRatio = _getWidth(context);
  }

  double _getHeight(BuildContext context) {
    return (MediaQuery.of(context).size.height / 640.0);
  }

  double _getWidth(BuildContext context) {
    return (MediaQuery.of(context).size.width / 360.0);
  }


}


class DashboardProvider extends InheritedWidget {
  final DashboardBlock block;

  DashboardProvider({Key key, @required DashboardBlock dataBlock, Widget child})
      : assert(dataBlock != null),
        block = dataBlock,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static DashboardBlock of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<DashboardProvider>())
          .block;
}

