import 'package:dispatcher/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dispatcher/core/utils/use_case.dart';
import 'package:dispatcher/features/location/domain/entities/location_permission_status_entity.dart';
import 'package:dispatcher/features/location/domain/repositories/location_permission_repository.dart';

class RequestPermission implements UseCase<LocationPermissionStatusEntity> {
  final LocationPermissionRequestRepository repository;

  RequestPermission({required this.repository});

  @override
  Future<Either<Failure, LocationPermissionStatusEntity>> call() async {
    return await repository.requestPermission();
  }
}
