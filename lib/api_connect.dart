import 'package:http/http.dart' as http;

import 'dart:convert';
import 'lanch.dart';

class APIConnection {
  
  dynamic decodeData;
 List<Lanches>? lanchesData;
  final String apiLanches = 'https://api.spacexdata.com/v3/launches';
  


  Future<void> getApiData() async {

  

    http.Response response = await http.get(Uri.parse(apiLanches));
    

    if (response.statusCode == 200) {

      decodeData = jsonDecode(response.body);
      lanchesData = lanchesFromJson(response.body);   

     
     
    } else {
      print(response.reasonPhrase);
    }
  }
}
