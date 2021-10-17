import 'package:dartz/dartz.dart';
import 'package:dispatcher/core/domain/use_cases/use_case.dart';
import 'package:dispatcher/core/error/errors.dart';
import 'package:dispatcher/features/location/domain/entities/position.dart';
import 'package:dispatcher/features/location/domain/repositories/position_repository.dart';

class PositionFetcher implements UseCase<Position> {
  late final PositionRepository repository;

  PositionFetcher({required this.repository});

  Future<Either<CustomError, Position>> call() async {
    return repository.getPosition();
  }
}
