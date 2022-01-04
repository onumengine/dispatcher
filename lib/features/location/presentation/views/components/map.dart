import 'package:dispatcher/features/location/presentation/view_models/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapComponent extends StatefulWidget {
  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  /*
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<MapViewModel>(context).addMarker(
      Marker(
        markerId: MarkerId('initial marker'),
        position: LatLng(0, 0),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    MapViewModel viewModel = context.read<MapViewModel>();

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: viewModel.target,
          zoom: viewModel.zoom,
        ),
        markers: viewModel.markers,
        onMapCreated: viewModel.setController,
      ),
    );
  }

  @override
  void dispose() {
    Provider.of<MapViewModel>(context).dispose();
    super.dispose();
  }
}
