import 'package:dispatcher/features/location/domain/use_cases/FetchLocation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  LatLng _pointerLocation = const LatLng(45.521563, -122.677433);
  LatLng get pointerLocation => _pointerLocation;

  Set<Marker> _markers = <Marker>{};
  Set<Marker> get markers => _markers;

  late double _zoom;
  double get zoom => _zoom;

  late final FetchLocation fetchLocation;

  MapViewModel({required this.fetchLocation})
      : _zoom = 1.0,
        _pointerLocation = LatLng(0, 0);

  void initializeController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void pinpointLocation() async {
    final result = await fetchLocation();
    result.fold(
      (failure) {
        print('FAILURE: $failure');
      },
      (locationEntity) {
        _pointerLocation =
            LatLng(locationEntity.latitude, locationEntity.longitude);
        notifyListeners();
      },
    );
  }

  void addMarker(Marker marker) {
    _markers.add(marker);
    notifyListeners();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
