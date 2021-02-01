import 'dart:convert';

import 'package:http/http.dart' as http;

class HTTPClient{
  HTTPClient._internal();

  factory HTTPClient(){
    return _instance;
  }

  static final HTTPClient _instance = new HTTPClient._internal();

  final String enlace="http://df46bc2ffdff.ngrok.io/api/v1/";

  String authToken;

  Map<String,String> _getRequestHeaders(){
    return {
      'Authorization': '$authToken',
      'Content-Type': 'application/json'
    };
  }

  Future<bool> login(String user, String pass) async {

    var bodyEncoded = jsonEncode(<String, String> {
      'username': user,
      'password': pass,
    });

    final response = await http.post(enlace+"authenticate", body: bodyEncoded, headers: {
      'Content-Type': 'application/json'
    });
    var resp = await jsonDecode(response.body);
    if(resp['error']!=null) {
      print("Error");
      return false;
    }
    else{
      authToken=resp['auth_token'];
      print(authToken);
      return true;
    }
  }
  
  
}