import 'package:equatable/equatable.dart';

class LocationPermissionStatusEntity extends Equatable {
  final bool granted;

  LocationPermissionStatusEntity({required this.granted});

  @override
  List<Object?> get props => [granted];
}
