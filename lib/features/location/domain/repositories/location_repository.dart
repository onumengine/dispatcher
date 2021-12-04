import 'package:dartz/dartz.dart';
import 'package:dispatcher/core/error/failure.dart';
import 'package:dispatcher/features/location/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationEntity>> getLocation();
}
