import 'package:dispatcher/core/presentation/bloc/home_event.dart';
import 'package:dispatcher/core/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
