import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:convert/convert.dart';
import 'package:patientengagement/models/articles_model.dart';




String baseUrl = "https://diyfinance.in:8443/DIYFINANCE/";

Future<dynamic> getArticle() async{
  try{
    String url = baseUrl + "user/forGettingArticles/2";
    var response = await http.get(Uri.encodeFull(url));
    if(response.statusCode == 200){
      Map jsonData = json.decode(response.body.toString());
      ArticlesApiResponse data = ArticlesApiResponse.fromJson(jsonData);
      return data;
    }
    else{
      return "Unable to fetch articles";
    }
  }
  catch(e){
    return "Unknown error";
  }
}

Future<dynamic> getYoga() async{
  try{
    String url = baseUrl + "user/forGettingArticles/1";
    var response = await http.get(Uri.encodeFull(url));
    if(response.statusCode == 200){
      Map jsonData = json.decode(response.body.toString());
      ArticlesApiResponse data = ArticlesApiResponse.fromJson(jsonData);
      return data;
    }
    else{
      return "Unable to fetch articles";
    }
  }
  catch(e){
    return "Unknown error";
  }
}

Future<dynamic> getHealthTip() async{
  try{
    String url = baseUrl + "user/forGettingArticles/4";
    var response = await http.get(Uri.encodeFull(url));
    if(response.statusCode == 200){
      Map jsonData = json.decode(response.body.toString());
      ArticlesApiResponse data = ArticlesApiResponse.fromJson(jsonData);
      return data;
    }
    else{
      return "Unable to fetch articles";
    }
  }
  catch(e){
    return "Unknown error";
  }
}

Future<dynamic> getExercise() async{
  try{
    String url = baseUrl + "user/forGettingArticles/3";
    var response = await http.get(Uri.encodeFull(url));
    if(response.statusCode == 200){
      Map jsonData = json.decode(response.body.toString());
      ArticlesApiResponse data = ArticlesApiResponse.fromJson(jsonData);
      return data;
    }
    else{
      return "Unable to fetch articles";
    }
  }
  catch(e){
    return "Unknown error";
  }
}

Future<dynamic> getVideos() async{
  try{
    String url = baseUrl + "user/getVideoContent/1";
    var response = await http.get(Uri.encodeFull(url));
    if(response.statusCode == 200){
      Map jsonData = json.decode(response.body.toString());
      VideosApiResponse data = VideosApiResponse.fromJson(jsonData);
      return data;
    }
    else{
      return "Unable to fetch articles";
    }
  }
  catch(e){
    return "Unknown error";
  }
}