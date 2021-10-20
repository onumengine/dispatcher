import 'package:geolocator/geolocator.dart';

enum PermissionStatus {
  granted,
  denied,
  deniedForever,
}

abstract class LocationPermissionInfo {
  Future<LocationPermission> getStatus();
}

class LocationPermissionInfoImplementation implements LocationPermissionInfo {
  @override
  Future<LocationPermission> getStatus() async {
    return await Geolocator.checkPermission();
  }
}
