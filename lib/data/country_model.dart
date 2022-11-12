import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class Country{
  Name? name;
  String? cca2;
  bool? independent;
  String? status;
  bool? unMember;
  Map? currencies;
  List? capital;
  String? region;
  String? subregion;
  Map? languages;
  bool? landlocked;
  double? area;
  double? population;
  List? continents;
  List? latlng;
  List? timezones;
  String? startOfWeek;
  Map? flags;
  Map? coatOfArms;
  Car? car;

  Country(
    this.name,
    this.cca2,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.capital,
    this.region,
    this.subregion,
    this.languages,
    this.landlocked,
    this.area,
    this.population,
    this.continents,
    this.latlng,
    this.timezones,
    this.startOfWeek,
    this.flags,
    this.coatOfArms,
    this.car,
  );


  factory Country.fromJson(Map<String, dynamic> country) => _$CountryFromJson(country);
}

@JsonSerializable()
class Name{
  final String? common;
  final String? official;
  Name(this.common, this.official);

  factory Name.fromJson(Map<String, dynamic> name) => _$NameFromJson(name);
}

@JsonSerializable()
class Car{
  final List? signs;
  final String? side;
  Car(this.signs, this.side);

  factory Car.fromJson(Map<String, dynamic> car) => _$CarFromJson(car);
}