import 'package:dispatcher/features/location/presentation/bloc/event.dart';
import 'package:dispatcher/features/location/presentation/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(LocationState initialState) : super(initialState);

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
