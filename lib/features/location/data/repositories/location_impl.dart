import 'package:dispatcher/core/platform/network_info.dart';
import 'package:dispatcher/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:dispatcher/features/location/domain/entities/location.dart';
import 'package:dispatcher/features/location/domain/repositories/location.dart';

class LocationRepoImplementation implements LocationRepository {
  final LocationRemoteDataSource locationDataSource;
  final NetworkInfo networkInfo;

  LocationRepoImplementation({
    required this.locationDataSource,
    required this.networkInfo,
  });

  @override
  Stream<Location> broadcastPosition() async* {
    Location location = await this.locationDataSource.getLocation();
    yield location;
  }

  @override
  Future<Location> getPosition() async {
    Location location = await this.locationDataSource.getLocation();
    return location;
  }
}
