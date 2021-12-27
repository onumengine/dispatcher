import 'package:dispatcher/features/location/domain/entities/location_entity.dart';
import 'package:geolocator/geolocator.dart';

class LocationModel extends LocationEntity {
  late final double? latitude,
      longitude,
      accuracy,
      altitude,
      heading,
      speed,
      speedAccuracy;
  late final DateTime? timeStamp;

  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.altitude,
    required this.heading,
    required this.speed,
    required this.speedAccuracy,
    required this.timeStamp,
  }) : super(
          latitude: latitude,
          longitude: longitude,
          accuracy: accuracy,
          altitude: altitude,
          heading: heading,
          speed: speed,
          speedAccuracy: speedAccuracy,
          timeStamp: timeStamp,
        );

  factory LocationModel.fromPosition(Position position) {
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      heading: position.heading,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      timeStamp: position.timestamp,
    );
  }

  Position toPosition() {
    return Position(
      longitude: longitude!,
      latitude: latitude!,
      timestamp: timeStamp,
      accuracy: accuracy!,
      altitude: altitude!,
      heading: heading!,
      speed: speed!,
      speedAccuracy: speedAccuracy!,
    );
  }

  factory LocationModel.fromJson(Map<dynamic, dynamic> locationInJson) {
    return LocationModel(
      latitude: locationInJson['latitude'],
      longitude: locationInJson['longitude'],
      accuracy: locationInJson['accuracy'],
      altitude: locationInJson['altitude'],
      heading: locationInJson['heading'],
      speed: locationInJson['speed'],
      speedAccuracy: locationInJson['speedAccuracy'],
      timeStamp: locationInJson['timeStamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'accuracy': accuracy,
      'altitude': altitude,
      'heading': heading,
      'speed': speed,
      'speedAccuracy': speedAccuracy,
      'timeStamp': timeStamp,
    };
  }

  @override
  String toString() {
    return 'latitude: $latitude \nlongitude: $longitude';
  }
}
