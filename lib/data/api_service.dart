import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class ApiService{
  Future getCountries() async {
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.countriesEndPoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // TODO: map to Country Model and add to list
        print(response.body);
      }
      return response.body;

    }catch(err){
      debugPrint(err.toString());
    }
  }
}

