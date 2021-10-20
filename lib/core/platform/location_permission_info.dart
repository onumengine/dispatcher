import 'package:geolocator/geolocator.dart';

abstract class LocationPermissionInfo {
  Future<LocationPermission> getStatus();
}

class LocationPermissionInfoImplementation implements LocationPermissionInfo {
  @override
  Future<LocationPermission> getStatus() async {
    return await Geolocator.checkPermission();
  }
}
