import 'package:dispatcher/features/location/domain/entities/position.dart';

abstract class LocationRepository {
  dynamic determinePosition() async* {}
  dynamic broadcastPosition() async {}
}
