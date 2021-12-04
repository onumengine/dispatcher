import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkConnectionFailure extends Failure {}

class LocationServiceDisabledFailure extends Failure {}

class LocationPermissionFailure extends Failure {}

class LocationFetchingFailure extends Failure {}
