import 'package:dispatcher/features/location/data/models/location_permission_status_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationPermissionDataSource {
  Future<LocationPermissionStatusModel> requestForLocationPermission();
}

class LocationPermissionDataSourceImpl implements LocationPermissionDataSource {
  @override
  Future<LocationPermissionStatusModel> requestForLocationPermission() async {
    try {
      final result = await Geolocator.requestPermission();
      return LocationPermissionStatusModel.fromRequest(result);
    } on Exception {
      rethrow;
    }
  }
}
