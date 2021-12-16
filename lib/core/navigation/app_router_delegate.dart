import 'package:dispatcher/core/navigation/route_names.dart';
import 'package:dispatcher/features/location/presentation/views/pages/map_page.dart';
import 'package:dispatcher/features/main/presentation/home_page.dart';
import 'package:dispatcher/features/main/presentation/service_selection_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouterDelegate extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  final GlobalKey<NavigatorState> _navigatorKey;

  AppRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) {
    final name = configuration.name;
    final length = configuration.state.length;
    return SynchronousFuture(null);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => false,
      pages: [
        MaterialPage(
          name: RouteNames.HOME,
          key: ValueKey(RouteNames.HOME),
          child: HomePage(),
        ),
        MaterialPage(
          name: RouteNames.MAP,
          key: ValueKey(RouteNames.MAP),
          child: MapPage(),
        ),
        MaterialPage(
          name: RouteNames.SERVICE_SELECTION,
          key: ValueKey(RouteNames.SERVICE_SELECTION),
          child: ServiceSelectionPage(),
        ),
      ],
    );
  }
}