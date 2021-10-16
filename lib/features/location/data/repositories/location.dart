import 'package:dispatcher/features/location/domain/entities/position.dart';
import 'package:dispatcher/features/location/domain/repositories/location.dart';

class LocationDataRepository implements LocationRepository {
  /// These methods return Position objects because repositories in the data
  /// layer are supposed to return entities

  @override
  Stream<Position> broadcastPosition() async* {
    // TODO: implement broadcastPosition
    throw UnimplementedError();
  }

  @override
  Future<Position> determinePosition() async {
    // TODO: implement broadcastPosition
    throw UnimplementedError();
  }
}
