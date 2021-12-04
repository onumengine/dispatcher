import 'package:dispatcher/features/location/presentation/view_models/MapViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapViewModel mapViewModel = context.watch<MapViewModel>();
    Size screenSize = MediaQuery.of(context).size;

    return Consumer<MapViewModel>(
      builder: (context, value, child) => Container(
        height: screenSize.height,
        width: screenSize.width,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: mapViewModel.pointerLocation,
            zoom: mapViewModel.zoom,
          ),
        ),
      ),
    );
  }
}
