import 'package:geolocator/geolocator.dart';

abstract class LocationPermissionChecker {
  Future<LocationPermission> requestPermission();
}