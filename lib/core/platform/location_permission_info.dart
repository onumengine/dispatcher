enum PermissionStatus {
  granted,
  denied,
  deniedForever,
}

abstract class LocationPermissionInfo {
  PermissionStatus get status;
}
