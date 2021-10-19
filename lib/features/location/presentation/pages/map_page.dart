import 'package:dispatcher/features/location/presentation/bloc/bloc.dart';
import 'package:dispatcher/features/location/presentation/bloc/event.dart';
import 'package:dispatcher/features/location/presentation/bloc/state.dart';
import 'package:dispatcher/features/location/presentation/components/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);
  late MapBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MapBloc>(context);
    return Scaffold(
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return Stack(
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
                  onPressed: () {
                    bloc.add(LocationPinpointEvent());
                  },
                  child: Icon(Icons.location_pin),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
