import 'dart:convert';
import 'package:http/http.dart';

class WebServices {
  
   Future<Map<String, dynamic>> login(String? email,String? password) async {
    Response response = await post(
        Uri.parse("https://flutter.prominaagency.com/api/auth/login"),
        body:  {
            'email':email,
            'password':password
          }
        
        );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      var data = jsonDecode(response.body);
      return data;
    }
  }

 
}
