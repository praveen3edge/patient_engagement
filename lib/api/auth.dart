import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


String baseUrl = "https://diyfinance.in:8443/DIYFINANCE/";

Future<dynamic> login(var body) async{
  try{

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    print(headers);

    String url = baseUrl + "user/loginApp";

    var response = await http.post(Uri.encodeFull(url),body: json.encode(body),headers: headers);
    print(response.body);
    if(response.statusCode == 200){
//      Map jsonData = json.decode(response.body.toString());
//      ArticlesApiResponse data = ArticlesApiResponse.fromJson(jsonData);
      return response.body;
    }
    else{
      return "Incorrect username and password";
    }
  }
  catch(e){
    return "Please check your internet connection";
  }
}