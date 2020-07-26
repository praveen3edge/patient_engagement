import 'package:flutter/material.dart';
import 'package:patientengagement/ui/authorization/login.dart';
import 'package:patientengagement/ui/contacts/contact_ui_tree/add_contacts.dart';
import 'package:patientengagement/ui/dashboard/main_ui.dart';
import 'package:patientengagement/ui/dashboard/ui_tree_screens/schedule_screen_ui.dart';
import 'package:patientengagement/ui/dashboard/ui_tree_screens/see_more_medications.dart';
import 'package:patientengagement/ui/learn/learn_ui.dart';
import 'package:patientengagement/ui/learn/read/article.dart';
import 'package:patientengagement/ui/learn/read/video.dart';
import 'package:patientengagement/ui/learn/tree_screens/all_healthtips.dart';
import 'package:patientengagement/ui/learn/tree_screens/all_videos.dart';
import 'package:patientengagement/ui/learn/tree_screens/all_yoga_tips.dart';
import 'package:patientengagement/ui/learn/tree_screens/articles.dart';
import 'package:patientengagement/ui/main_ui.dart';



class FadeTransitionMaterialRouteBuilder<T> extends MaterialPageRoute<T>{
  FadeTransitionMaterialRouteBuilder({WidgetBuilder builder,RouteSettings settings}):super(builder:builder,settings:settings);


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return new FadeTransition(opacity: animation,child: child,);
  }

}


MaterialPageRoute pageRouteGenerator(RouteSettings settings){

  WidgetBuilder builder;

  switch(settings.name){

    case '/dashboard':
      builder = (BuildContext context)=>MainRouterClass();
      break;
    case '/seeallmedications':
      builder = (BuildContext context)=>SeeMoreMedications();
      break;
    case '/scheculevisit':
      builder = (BuildContext context)=>ScheduleVisitScreen();
      break;
    case '/addcontact':
      builder = (BuildContext context)=>AddContacts();
      break;

    case '/allarticles':
      builder = (BuildContext context)=>ShowAllArticles();
      break;


    case '/allyogatip':
      builder = (BuildContext context)=>ShowAllYogaTips();
      break;
    case '/allvideos':
      builder = (BuildContext context)=>ShowAllVideos();
      break;
    case '/allhealthtip':
      builder = (BuildContext context)=>ShowAllHealthTip();
      break;
    case '/playvideo':
      builder = (BuildContext context)=>PlayVideoArticle(null);
      break;
    case '/viewarticle':
      builder = (BuildContext context)=>ReadArticle(null,null);
      break;

    case '/login':
      builder = (BuildContext context)=>LoginUi();
      break;


    default:
      builder = (BuildContext context)=>Scaffold();
      break;
  }

  return FadeTransitionMaterialRouteBuilder(builder: builder,settings: settings);

}