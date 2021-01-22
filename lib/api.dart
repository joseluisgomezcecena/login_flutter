import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email, String password) async {
  //String url = "http://174.136.25.23/api/login.php";
  String url = "http://192.168.1.78/Quatro/quatro_api/login.php";
  final response = await http.post(url,
  headers: {"Accept": "application/json"},
  body: {'email': email, 'password': password}//post data sent to server
  );

  /*
  if (response.statusCode != 200) {
  }
  */
  if(response.body.isNotEmpty) {

    try {
      jsonDecode(response.body);
      print('trying to decode  Respose Body result is : success');
    } catch (Ex) {
      print("Exepition with json decode : $Ex" + response.body);
    }

    var datajson = jsonDecode(response.body);
    return datajson;

  }



}
