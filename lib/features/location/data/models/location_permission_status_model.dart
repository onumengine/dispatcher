import 'package:dispatcher/features/location/domain/entities/location_permission_status_entity.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionStatusModel extends LocationPermissionStatusEntity {
  final bool granted;

  LocationPermissionStatusModel({required this.granted})
      : super(granted: granted);

  factory LocationPermissionStatusModel.fromRequest(LocationPermission result) {
    if (result == LocationPermission.always ||
        result == LocationPermission.whileInUse) {
      return LocationPermissionStatusModel(granted: true);
    } else {
      return LocationPermissionStatusModel(granted: false);
    }
  }
}
