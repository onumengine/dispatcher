import 'package:dispatcher/core/platform/location_service_info.dart';

abstract class LocationServiceDataSource {
  Future<bool> locationServiceIsEnabled();
}

class LocationServiceDataSourceImplementation implements LocationServiceDataSource {
  final LocationServiceInfo locationServiceInfo;

  LocationServiceDataSourceImplementation(this.locationServiceInfo);

  @override
  Future<bool> locationServiceIsEnabled() async {
    return await locationServiceInfo.locationIsEnabled();
  }
}