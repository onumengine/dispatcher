import 'package:dispatcher/features/location/presentation/bloc/bloc.dart';
import 'package:dispatcher/features/location/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapBloc _locationBloc = BlocProvider.of<MapBloc>(context);
    Size screenSize = MediaQuery.of(context).size;

    return BlocBuilder<MapBloc, MapState>(
      bloc: _locationBloc,
      builder: (context, state) {
        if (state is MapLoadedState) {
          return Container(
            height: screenSize.height,
            width: screenSize.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: state.pointerLocation,
                zoom: state.zoom,
              ),
            ),
          );
        } else {
          return Center(
            child: Text('Map not loaded'),
          );
        }
      },
    );
  }
}
