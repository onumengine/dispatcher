import 'package:dispatcher/features/location/presentation/view_models/map_view_model.dart';
import 'package:dispatcher/features/location/presentation/views/components/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<MapViewModel>(builder: (context, viewModel, child) {
        return Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            MapComponent(),
            Positioned(
              left: 24,
              bottom: 32,
              child: RawMaterialButton(
                constraints: BoxConstraints(minHeight: 60, minWidth: 60),
                fillColor: Theme.of(context).primaryColor,
                shape: CircleBorder(),
                onPressed: () async {
                  //Provider.of<MapViewModel>(context).addMarker(
                  viewModel.addMarker(
                    Marker(
                      markerId: MarkerId('initial marker'),
                      position: LatLng(0, 0),
                    ),
                  );
                  //await Provider.of<MapViewModel>(context).pinpointLocation();
                  await viewModel.pinpointLocation();
                },
                child: Icon(Icons.location_pin),
              ),
            ),
          ],
        );
      }),
    );
  }
}
