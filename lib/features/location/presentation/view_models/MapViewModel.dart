import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  late GoogleMapController _mapController;
  GoogleMapController get mapController => _mapController;

  LatLng _pointerLocation = const LatLng(45.521563, -122.677433);
  LatLng get pointerLocation => _pointerLocation;

  late double _zoom;
  double get zoom => _zoom;

  void initializeController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void pinpointLocation() {
    _pointerLocation = const LatLng(21, 12);
    notifyListeners();
  }
}
