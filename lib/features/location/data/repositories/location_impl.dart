import 'package:dispatcher/features/location/domain/entities/location.dart';
import 'package:dispatcher/features/location/domain/repositories/location.dart';

class LocationRepoImplementation implements LocationRepository {
  /// These methods return Position objects because repositories in the data
  /// layer are supposed to return entities

  @override
  Stream<Location> broadcastPosition() async* {
    // TODO: implement broadcastPosition
    throw UnimplementedError();
  }

  @override
  Future<Location> getPosition() async {
    // TODO: implement broadcastPosition
    throw UnimplementedError();
  }
}
