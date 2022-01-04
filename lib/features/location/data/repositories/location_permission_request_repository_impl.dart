import 'package:dispatcher/features/location/domain/entities/location_permission_status_entity.dart';
import 'package:dispatcher/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dispatcher/features/location/domain/repositories/location_permission_repository.dart';

class LocationPermissionRequestRepositoryImpl
    implements LocationPermissionRequestRepository {
  final permissionSource;

  LocationPermissionRequestRepositoryImpl({required this.permissionSource});

  @override
  Future<Either<Failure, LocationPermissionStatusEntity>>
      requestPermission() async {
    return await permissionSource.requestPermission();
  }
}
