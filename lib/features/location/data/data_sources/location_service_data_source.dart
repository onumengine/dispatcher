import 'package:dispatcher/features/location/data/models/location_service_model.dart';

abstract class LocationServiceDataSource {
  requestLocationService();
}

class DeviceLocationServiceDataSource implements LocationServiceDataSource {
  DeviceLocationServiceDataSource();

  @override
  void requestLocationService() async {
    // TODO: Write code to check if the location service is enabled
  }
}
