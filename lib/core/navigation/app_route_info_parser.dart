import 'package:dispatcher/core/navigation/route_info_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouteInfoParser<T extends RouteInfoModel> extends RouteInformationParser<RouteInfoModel> {
  @override
  Future<RouteInfoModel> parseRouteInformation(RouteInformation routeInformation) async {
    final RouteInfoModel model = RouteInfoModel.fromRouteInformation(routeInformation);
    return SynchronousFuture(model);
  }
}