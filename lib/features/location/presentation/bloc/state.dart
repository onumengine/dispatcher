import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class MapLoadedState extends MapState {
  late final LatLng pointerLocation;
  double zoom;

  MapLoadedState({
    required this.pointerLocation,
    this.zoom = 11.0,
  });

  @override
  List<Object?> get props => [this.pointerLocation];
}
