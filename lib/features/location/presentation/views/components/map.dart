import 'package:dispatcher/features/location/presentation/view_models/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapViewModel mapViewModel = context.watch<MapViewModel>();
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: mapViewModel.pointerLocation,
          zoom: mapViewModel.zoom,
        ),
      ),
    );
  }
}
