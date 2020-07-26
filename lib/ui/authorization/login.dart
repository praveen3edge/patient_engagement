import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patientengagement/block/dashboard_block.dart';
import 'package:patientengagement/ui/common/loaders.dart';
import 'package:patientengagement/ui/common/text_field.dart';
import 'package:patientengagement/utils/colors.dart';


class LoginUi extends StatefulWidget{
  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {

  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _password = TextEditingController(text: "");

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text("User Login",style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 28,fontWeight: FontWeight.bold
              ),),

              SizedBox(height: 30,),

              SvgPicture.asset("assets/svg/login_doctor.svg",height: 100,width: 100,),

              SizedBox(height: 60,),

              TextFieldWithBackground(
                hintText: 'Enter user name',
                controller: _email,
                validator: (String s) {
                  return null;
                },
                backGroundColor: AppColor.grey.withOpacity(0.1),
                iconData: Icons.person,
              ),
              SizedBox(height: 20,),
              TextFieldWithBackground(
                hintText: 'Enter Password',
                controller: _password,
                isPassword: true,
                validator: (String s) {
                  return null;
                },
                backGroundColor: AppColor.grey.withOpacity(0.1),
                iconData: Icons.lock_open,
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
          child: Container(
//              color: Colors.redAccent,
            height: 70,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    color: AppColor.grey.withOpacity(0.2),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                    bottom: 25,
                    right: 30,
                    child: RaisedButton(
                      color: AppColor.violet,
                      onPressed: () async{

                        if(_formKey.currentState.validate()) {

                          callLoader(context: context);
                          var response = await DashboardProvider.of(context).callApiLogin(_email.text,_password.text);
                          print(response);
                          if(response == "SUCCESS"){

                            Navigator.pop(context);
                            Navigator.of(context).pushReplacementNamed('/dashboard');

                          }
                          else{

                            Navigator.pop(context);
                            final snackBar = SnackBar(content: Text('$response'));

                            print("error");
//                            Scaffold.of(context).showSnackBar(snackBar);
                            _scaffoldKey.currentState.showSnackBar(snackBar);

                          }


                        }
                        else{
                          print("Error ");
                          Navigator.pop(context);
                          final snackBar = SnackBar(content: Text('Error'));

                          print("error");
//                            Scaffold.of(context).showSnackBar(snackBar);
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                        }

                      },
                      child: Row(
                        children: <Widget>[
                          new Text(
                            "   Continue",
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(fontSize: 14, color: AppColor.white),
                          ),
                          new SizedBox(
                            width: 8,
                          ),
                          new Icon(
                            Icons.arrow_forward_ios,
                            color: AppColor.white,
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 70)),
    );
  }
}