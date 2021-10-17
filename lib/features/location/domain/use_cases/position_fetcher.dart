import 'package:dartz/dartz.dart';
import 'package:dispatcher/core/error/errors.dart';
import 'package:dispatcher/features/location/domain/entities/position.dart';
import 'package:dispatcher/features/location/domain/repositories/position_repository.dart';

class PositionFetcher {
  late final PositionRepository repository;

  PositionFetcher({required this.repository});

  Future<Either<CustomError, Position>> execute() async {
    return repository.getPosition();
  }
}
