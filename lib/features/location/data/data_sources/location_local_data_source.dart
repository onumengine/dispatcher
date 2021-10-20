import 'package:dispatcher/features/location/domain/entities/location.dart';

abstract class LocationLocalDataSource {
  Future<Location> getLastCachedLocation();
  Future<bool> cacheLocation(Location location);
}
