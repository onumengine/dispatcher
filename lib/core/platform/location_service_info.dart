import 'package:geolocator/geolocator.dart';

abstract class LocationServiceInfo {
  Future<bool> locationIsEnabled();
}

class LocationServiceInfoImplementation implements LocationServiceInfo {
  Future<bool> locationIsEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}