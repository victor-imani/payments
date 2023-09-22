// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:payments/models/data_model.dart';
// import 'package:flutter/services.dart' show rootBundle;

class DataServices {
  final String _baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<DataModel>> getUsers() async {
    var apiUrl = '/billinfo';

    http.Response response = await http.get(Uri.parse(_baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
      
        List<dynamic> list = await json.decode(response.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
        
      } else {
        print("Something went wrong");
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      print("API request failed");
      return <DataModel>[];
    }

    //   var info = rootBundle.loadString("json/data.json");
    //   List<dynamic> list = json.decode(await info);

    //   return Future.delayed(
    //       const Duration(seconds: 5), () => list.map((e) => e).toList());
    // }
  }
}
