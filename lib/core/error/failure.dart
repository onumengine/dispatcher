import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationDisabledError extends Failure {}

class LocationPermissionError extends Failure {}
