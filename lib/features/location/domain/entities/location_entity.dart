import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double? latitude,
      longitude,
      accuracy,
      altitude,
      heading,
      speed,
      speedAccuracy;
  late final DateTime? timeStamp;

  LocationEntity({
    required this.latitude,
    required this.longitude,
    this.accuracy,
    this.altitude,
    this.heading,
    this.speed,
    this.speedAccuracy,
    this.timeStamp,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        accuracy,
        altitude,
        heading,
        speed,
        speedAccuracy,
        timeStamp,
      ];
}
