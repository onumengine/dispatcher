import 'package:geolocator/geolocator.dart';

abstract class LocationPermissionInfo {
  Future<bool> get locationPermissionIsGranted;
  Future<LocationPermission> getLocationPermission();
}

class LocationPermissionInfoImplementation implements LocationPermissionInfo {
  Future<bool> get locationPermissionIsGranted async =>
      await Geolocator.checkPermission() == LocationPermission.always;

  Future<LocationPermission> getLocationPermission() async =>
      await Geolocator.requestPermission();
}
