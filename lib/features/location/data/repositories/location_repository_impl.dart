import 'package:dispatcher/core/network/network_info.dart';
import 'package:dispatcher/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:dispatcher/features/location/domain/entities/location_entity.dart';
import 'package:dispatcher/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImplementation implements LocationRepository {
  final LocationRemoteDataSource locationDataSource;
  final NetworkInfo networkInfo;

  LocationRepositoryImplementation({
    required this.locationDataSource,
    required this.networkInfo,
  });

  @override
  Stream<LocationEntity> broadcastLocation() async* {
    LocationEntity location = await this.locationDataSource.getLocation();
    yield location;
  }

  @override
  Future<LocationEntity> getLocation() async {
    LocationEntity location = await this.locationDataSource.getLocation();
    return location;
  }
}
