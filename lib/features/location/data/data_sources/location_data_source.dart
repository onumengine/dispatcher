import 'package:geolocator/geolocator.dart';

abstract class LocationDataSource {
  Future<Position> getLocation();
  Future<void> cacheLocation(Position location);
}

class LocationApi implements LocationDataSource {
  /// I can use just the same [fetchLocation] method for broadcasting.
  /// All I have to do is call it multiple times

  Future<Position> getLocation() async {
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

  @override
  Future<void> cacheLocation(Position location) {
    // TODO: implement cacheLocation
    throw UnimplementedError();
  }
}
