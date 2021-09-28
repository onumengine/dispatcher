import 'package:dispatcher/bloc/map_screen/event.dart';
import 'package:dispatcher/bloc/map_screen/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapScreenBloc extends Bloc<MapScreenEvent, MapScreenState> {
  MapScreenBloc(MapScreenState initialState) : super(initialState);

  @override
  Stream<MapScreenState> mapEventToState(MapScreenEvent event) {
    throw UnimplementedError();
  }
}
