import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double latitude, longitude;

  LocationEntity({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
