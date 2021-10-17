import 'dart:convert';

import 'package:dispatcher/features/location/domain/entities/position.dart';

class LocationModel extends Position {
  late final double latitude, longitude;

  LocationModel.fromJsonString(String jsonString)
      : super(
          latitude: jsonDecode(jsonString)['latitude'],
          longitude: jsonDecode(jsonString)['longitude'],
        );

  LocationModel.fromJsonMap(Map<dynamic, dynamic> locationInJson)
      : super(
          latitude: locationInJson['latitude'],
          longitude: locationInJson['longitude'],
        );

  String toJsonString() {
    return jsonEncode({
      'latitude': '$latitude',
      'longitude': '$longitude',
    });
  }

  Map<String, String> toJsonMap() {
    return {
      'latitude': '$latitude',
      'longitude': '$longitude',
    };
  }

  @override
  String toString() {
    return 'latitude: $latitude \nlongitude: $longitude';
  }
}
