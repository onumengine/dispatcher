import 'package:dispatcher/core/platform/location_service_info.dart';

abstract class LocationServiceDataSource {
  Future<bool> locationServiceIsEnabled();
}

class DeviceLocationServiceDataSource implements LocationServiceDataSource {
  final LocationServiceInfo locationServiceInfo;

  DeviceLocationServiceDataSource(this.locationServiceInfo);

  @override
  Future<bool> locationServiceIsEnabled() async {
    return await locationServiceInfo.locationIsEnabled();
  }
}