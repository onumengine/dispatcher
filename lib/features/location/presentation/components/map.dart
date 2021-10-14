import 'package:dispatcher/features/location/presentation/bloc/bloc.dart';
import 'package:dispatcher/features/location/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocationBloc _locationBloc = BlocProvider.of<LocationBloc>(context);

    return BlocBuilder<LocationBloc, LocationState>(
      bloc: _locationBloc,
      builder: (context, state) {
        return Container();
      },
    );
  }
}
