// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      json['cca2'] as String?,
      json['independent'] as bool?,
      json['status'] as String?,
      json['unMember'] as bool?,
      json['currencies'] as Map<String, dynamic>?,
      json['capital'] as List<dynamic>?,
      json['region'] as String?,
      json['subregion'] as String?,
      json['languages'] as Map<String, dynamic>?,
      json['landlocked'] as bool?,
      (json['area'] as num?)?.toDouble(),
      (json['population'] as num?)?.toDouble(),
      json['continents'] as List<dynamic>?,
      json['latlng'] as List<dynamic>?,
      json['timezones'] as List<dynamic>?,
      json['startOfWeek'] as String?,
      json['flags'] as Map<String, dynamic>?,
      json['coatOfArms'] as Map<String, dynamic>?,
      json['car'] == null
          ? null
          : Car.fromJson(json['car'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'cca2': instance.cca2,
      'independent': instance.independent,
      'status': instance.status,
      'unMember': instance.unMember,
      'currencies': instance.currencies,
      'capital': instance.capital,
      'region': instance.region,
      'subregion': instance.subregion,
      'languages': instance.languages,
      'landlocked': instance.landlocked,
      'area': instance.area,
      'population': instance.population,
      'continents': instance.continents,
      'latlng': instance.latlng,
      'timezones': instance.timezones,
      'startOfWeek': instance.startOfWeek,
      'flags': instance.flags,
      'coatOfArms': instance.coatOfArms,
      'car': instance.car,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      json['common'] as String?,
      json['official'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
    };

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      json['signs'] as List<dynamic>?,
      json['side'] as String?,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'signs': instance.signs,
      'side': instance.side,
    };
