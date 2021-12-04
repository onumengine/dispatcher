import 'package:geolocator/geolocator.dart';

abstract class LocationServiceInfo {
  Future<bool> get locationServiceIsEnabled;
}

class LocationServiceInfoImplementation implements LocationServiceInfo {
  Future<bool> get locationServiceIsEnabled async =>
      await Geolocator.isLocationServiceEnabled();
}
