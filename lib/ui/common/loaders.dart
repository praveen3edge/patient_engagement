import 'package:flutter/material.dart';
import 'package:patientengagement/utils/colors.dart';


void callLoader({BuildContext context,bool canGoBack = false}) {
  Navigator.push(
      context,
      PageRouteBuilder(
          opaque: false,
          barrierColor: Colors.white.withOpacity(0.6),
          barrierDismissible: false,
          maintainState: true,
          pageBuilder: (context,_,__) {
            return Theme(
              data: new ThemeData(
                scaffoldBackgroundColor: Colors.transparent,
                primaryColor: Colors.transparent,
              ),
              child: WillPopScope(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(AppColor.violet),
                    ),
                  ),
                  onWillPop: () async {
                    return canGoBack;
                  }),
            );
          }));
}