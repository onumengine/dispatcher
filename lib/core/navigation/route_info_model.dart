import 'package:flutter/material.dart';

class RouteInfoModel {
  String name;

  RouteInfoModel(this.name);

  RouteInfoModel.fromRouteInformation(RouteInformation information): name = information.location!;
}