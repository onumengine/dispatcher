import 'package:dispatcher/features/location/presentation/view_models/MapViewModel.dart';
import 'package:dispatcher/features/location/presentation/views/components/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapViewModel mapViewModel = context.watch<MapViewModel>();
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          MapComponent(),
          Positioned(
            left: 24,
            bottom: 32,
            child: RawMaterialButton(
              fillColor: Colors.greenAccent,
              onPressed: () {},
            ),
          ),
          Positioned(
            left: 24,
            bottom: 32,
            child: RawMaterialButton(
              fillColor: Colors.greenAccent,
              shape: CircleBorder(),
              onPressed: mapViewModel.pinpointLocation,
              child: Icon(Icons.location_pin),
            ),
          ),
        ],
      ),
    );
  }
}
