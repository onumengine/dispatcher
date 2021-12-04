import 'package:geolocator/geolocator.dart';

abstract class LocationPermissionInfo {
  Future<bool> get locationPermissionIsGranted;
  Future<LocationPermission> get getLocationPermission;
}

class LocationPermissionInfoImplementation implements LocationPermissionInfo {
  Future<bool> get locationPermissionIsGranted async =>
      await Geolocator.checkPermission() == LocationPermission.always;

  Future<LocationPermission> get getLocationPermission async =>
      await Geolocator.checkPermission();
}
