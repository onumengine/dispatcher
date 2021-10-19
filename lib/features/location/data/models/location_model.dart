import 'dart:convert';

import 'package:dispatcher/features/location/domain/entities/location.dart';

class LocationModel extends Location {
  late final double latitude, longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  }) : super(latitude: latitude, longitude: longitude);

  factory LocationModel.fromJsonString(String jsonString) {
    return LocationModel(
      latitude: jsonDecode(jsonString)['latitude'],
      longitude: jsonDecode(jsonString)['longitude'],
    );
  }

  factory LocationModel.fromJsonMap(Map<dynamic, dynamic> locationInJson) {
    return LocationModel(
      latitude: locationInJson['latitude'],
      longitude: locationInJson['longitude'],
    );
  }

  String toJsonString() {
    return jsonEncode({
      'latitude': latitude,
      'longitude': longitude,
    });
  }

  Map<String, dynamic> toJsonMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return 'latitude: $latitude \nlongitude: $longitude';
  }
}
