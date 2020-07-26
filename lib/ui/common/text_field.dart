import 'package:flutter/material.dart';

import 'package:patientengagement/utils/colors.dart';



class TextFieldWithBackground extends StatefulWidget{
  bool isPassword;
  String hintText;
  Color backGroundColor;
  TextEditingController controller;
  Function(String) validator;
  IconData iconData;
  TextFieldWithBackground(
      {
        this.isPassword=false,this.hintText,this.backGroundColor,this.controller,this.validator,this.iconData
      }
      );

  @override
  _TextFieldWithBackgroundState createState() => _TextFieldWithBackgroundState();
}

class _TextFieldWithBackgroundState extends State<TextFieldWithBackground> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Container(
        decoration: BoxDecoration(
            color: widget.backGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            obscureText: widget.isPassword,
            controller: widget.controller,
            style: Theme.of(context).textTheme.headline1.copyWith(
              fontSize: 16,fontWeight: FontWeight.normal
            ),
            validator: widget.validator,
            cursorColor: AppColor.blackCommon,
            decoration: InputDecoration(
              hintText: widget.hintText,//'Enter Email',
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: AppColor.grey.withOpacity(0.6),fontWeight: FontWeight.normal),
              prefixIcon: Icon(widget.iconData,color: AppColor.grey.withOpacity(0.7),),
              border: true?InputBorder.none:UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.grey),
              ),
              focusedBorder: true?InputBorder.none:UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}