import 'package:flutter/material.dart';
import 'package:patientengagement/utils/export_utils.dart';

class ShowHealthTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColor.grey.withOpacity(0.1),
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8),
          child: ListTile(
            title: Text("20 Simple Tips That Help You Fall Asleep Quickly",style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 14,color: AppColor.blackCommon
            ),),
            subtitle: Text("""The “4-7-8” method is a simple but powerful breathing method that promotes calmness and relaxation. It might also help you unwind before bed. First, place the tip of your tongue behind your upper front teeth Exhale completely through your mouth and make a whoosh sound.""",textAlign: TextAlign.justify,style: Theme.of(context).textTheme.headline4.copyWith(
              fontSize: 12,
            ),),
          ),
        ),
      ),
    );
  }
}