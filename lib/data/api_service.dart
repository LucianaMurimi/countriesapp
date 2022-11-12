import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_constants.dart';
import 'package:explore/data/country_model.dart';


class ApiService{
  Future getCountries() async {
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.countriesEndPoint);
      var response = await http.get(url);
      List<Country> countries = [];

      if (response.statusCode == 200) {
        List _countries = json.decode(response.body);
        for(var country in _countries){
          countries.add(Country.fromJson(country));
        }
      }

      return countries;
    }catch(err){
      debugPrint(err.toString());
    }
  }
}

