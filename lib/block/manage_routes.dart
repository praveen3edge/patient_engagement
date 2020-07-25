import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class RoutesBlock{


  final _path = BehaviorSubject<String>();
  Stream<String> get pathStream => _path.stream;
  String currentPath = '/dashboard';




  void changePath(String path){
    currentPath = path;
    _path.add(path);
  }



}


class RouteProvider extends InheritedWidget {
  final RoutesBlock block;

  RouteProvider({Key key, @required RoutesBlock dataBlock, Widget child})
      : assert(dataBlock != null),
        block = dataBlock,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RoutesBlock of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<RouteProvider>())
          .block;
}

