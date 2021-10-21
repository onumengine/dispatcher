import 'package:dartz/dartz.dart';
import 'package:dispatcher/features/main/domain/use_cases/use_case.dart';
import 'package:dispatcher/core/error/failure.dart';
import 'package:dispatcher/features/location/domain/entities/location_entity.dart';
import 'package:dispatcher/features/location/domain/repositories/location_repository.dart';

class LocationFetcher implements UseCase<LocationEntity> {
  late final LocationRepository repository;

  LocationFetcher({required this.repository});

  Future<Either<Failure, LocationEntity>> call() async {
    return repository.getLocation();
  }
}
