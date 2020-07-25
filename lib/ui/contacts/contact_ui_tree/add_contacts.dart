import 'package:flutter/material.dart';
import 'package:patientengagement/ui/common/app_bar.dart';
import 'package:patientengagement/utils/colors.dart';



class AddContacts extends StatefulWidget{
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = new TextEditingController();
  TextEditingController _number = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundGrey,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            TopBar("Add contact",nameOfButton: "save",callBack: (){
              print("save");
            },),
            Form(
              key: _formKey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text("Name *",style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14
                          ),),
                          new TextFormField(

                            controller: _name,
                            cursorColor: AppColor.blackCommon,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter a name for your emergency contact..'
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16,),

                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text("Number *",style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 14
                          ),),
                          new TextFormField(

                            controller: _name,
                            cursorColor: AppColor.blackCommon,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter the number of your emergency contact..'
                            ),

                          ),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}