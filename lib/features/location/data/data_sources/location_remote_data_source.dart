import 'package:dispatcher/core/platform/location_permission_info.dart';
import 'package:dispatcher/features/location/data/models/location_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRemoteDataSource {
  Future<LocationModel> getLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final LocationPermissionInfo permissionInfo;

  LocationRemoteDataSourceImpl({
    required this.permissionInfo
  });
  
  Future<LocationModel> getLocation() async {
    Position position = await getPosition();
    return LocationModel.fromPosition(position);
  }

  Future<Position> getPosition() async {
    bool locationServiceIsEnabled;
    LocationPermission permission;
    Position position;

    locationServiceIsEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceIsEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions have been denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    position = await Geolocator.getCurrentPosition();
    print(position.toString());
    return position;
  }
}
