import 'package:dispatcher/features/location/domain/entities/location_entity.dart';

abstract class LocationLocalDataSource {
  Future<LocationEntity> getLastCachedLocation();
  Future<bool> cacheLocation(LocationEntity location);
}
