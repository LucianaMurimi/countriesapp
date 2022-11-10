import 'package:flutter/material.dart';
import 'package:explore/data/api_service.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    var countries = ()async => await ApiService().getCountries();
    return Container(
      child: Text(countries.toString())
    );
  }
}
