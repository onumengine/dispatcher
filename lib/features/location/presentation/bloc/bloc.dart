import 'package:dispatcher/features/location/presentation/bloc/event.dart';
import 'package:dispatcher/features/location/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  late GoogleMapController mapController;
  LatLng pointerLocation = const LatLng(45.521563, -122.677433);

  MapBloc(MapState initialState) : super(initialState);

  @override
  Stream<MapState> mapEventToState(MapEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  void _initializeController(GoogleMapController controller) {
    mapController = controller;
  }
}
