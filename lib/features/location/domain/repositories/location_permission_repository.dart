import 'package:dartz/dartz.dart';
import 'package:dispatcher/core/error/failure.dart';
import 'package:dispatcher/features/location/domain/entities/location_permission_status_entity.dart';

abstract class LocationPermissionRequestRepository {
  Future<Either<Failure, LocationPermissionStatusEntity>> requestPermission();
}
