import 'package:dispatcher/features/location/data/models/location_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationSensorDataSource {
  Future<LocationModel> getLocation();
}

class LocationSensorDataSourceImpl implements LocationSensorDataSource {
  LocationSensorDataSourceImpl();

  Future<LocationModel> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return LocationModel.fromPosition(position);
    } on Exception catch (e) {
      throw e;
    }
  }

  /*
  TODO: Delete this method if the tests for location and permission pass
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
  */
}
