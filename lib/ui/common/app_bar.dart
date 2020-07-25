import 'package:flutter/material.dart';
import 'package:patientengagement/utils/colors.dart';



class TopBar extends StatelessWidget{
  String title;
  String nameOfButton;
  Function callBack;
  TopBar(this.title,{this.nameOfButton,this.callBack});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71,
//      color: Colors.red,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          new IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.keyboard_backspace,color: AppColor.blackCommon,)),

          Text("$title",style: Theme.of(context).textTheme.headline3.copyWith(
            color: AppColor.blackCommon,fontSize: 18
          ),),



          (callBack == null)?Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 71,
              width: 50,
            ),
          ):Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: (){
                callBack();
              },
              child: Container(
                height: 71,
//              width: 50,
                child: Center(
                  child: Text("$nameOfButton",style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: AppColor.violet,fontSize: 16,
                  ),),
                ),
              ),
            ),
          ),

        ],

      ),
    );
  }

}