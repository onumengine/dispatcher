import 'package:dartz/dartz.dart';
import 'package:dispatcher/features/main/domain/use_cases/use_case.dart';
import 'package:dispatcher/core/error/failure.dart';
import 'package:dispatcher/features/location/domain/entities/location.dart';
import 'package:dispatcher/features/location/domain/repositories/location.dart';

class LocationFetcher implements UseCase<Location> {
  late final LocationRepository repository;

  LocationFetcher({required this.repository});

  Future<Either<Failure, Location>> call() async {
    return repository.getPosition();
  }
}
