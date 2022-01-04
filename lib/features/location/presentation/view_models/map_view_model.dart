import 'package:dispatcher/features/location/domain/use_cases/fetch_location.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  // USE CASE
  late final FetchLocation fetchLocation;

  // PRIVATE FIELDS
  late GoogleMapController _mapController;
  Set<Marker> _markers = <Marker>{};
  LatLng _target = const LatLng(45.521563, -122.677433);
  late double _zoom;

  // GETTERS
  GoogleMapController get mapController => _mapController;
  Set<Marker> get markers => _markers;
  LatLng get target => _target;
  double get zoom => _zoom;

  void setController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void setTarget(LatLng target) {
    _target = target;
    notifyListeners();
  }

  void setZoom(double zoom) {
    _zoom = zoom;
    notifyListeners();
  }

  MapViewModel({required this.fetchLocation})
      : _zoom = 1.0,
        _target = LatLng(0, 0);

  void addMarker(Marker marker) {
    _markers.add(marker);
    notifyListeners();
  }

  Future<void> pinpointLocation() async {
    final result = await fetchLocation();
    result.fold(
      (failure) {
        print('FAILURE: $failure');
      },
      (locationEntity) {
        _target = LatLng(locationEntity.latitude!, locationEntity.longitude!);
        print(locationEntity);
        addMarker(
          Marker(
            markerId: MarkerId('MyLocation'),
            position: LatLng(
              locationEntity.latitude!,
              locationEntity.longitude!,
            ),
          ),
        );
        notifyListeners();
      },
    );
  }

  void goToLocation(LatLng coOrdinates) {
    _mapController.animateCamera(
      CameraUpdate.newLatLng(coOrdinates),
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
