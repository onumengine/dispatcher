import 'package:dartz/dartz.dart';
import 'package:dispatcher/core/error/errors.dart';

abstract class UseCase<Type> {
  Future<Either<CustomError, Type>> call();
}
