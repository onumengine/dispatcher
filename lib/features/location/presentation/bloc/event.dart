import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ControllerInitializationEvent extends MapEvent {
  late final GoogleMapController controller;

  ControllerInitializationEvent(this.controller);

  @override
  List<Object?> get props => [this.controller];
}

class LocationPinpointEvent extends MapEvent {}

class ZoomIncrementEvent extends MapEvent {}

class ZoomDecrementEvent extends MapEvent {}
