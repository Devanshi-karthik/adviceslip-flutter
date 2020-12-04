
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Quotes with ChangeNotifier {

  String data;
  Future<String> getdata() async {
    var url ="https://api.adviceslip.com/advice";
    try{
      var response = await http.get(
          url,

      );
      //print(response.body);
      var jsonData= json.decode(response.body);
      data = jsonData ["slip"]["advice"];
      print(data);

    }
    catch(error)
    {
      print(error);
    }

    notifyListeners();
    return data;
  }
}
