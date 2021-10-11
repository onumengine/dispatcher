import 'dart:io';

import 'package:dispatcher/ui/organisms/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => Center(
          child: Text('Where do you wanna go?'),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => Center(
          child: Text('Where do you wanna go?'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          MapComponent(),
          Positioned(
            child: RawMaterialButton(
              onPressed: () {},
            ),
          ),
          Positioned(
            child: RawMaterialButton(
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> determineLocation() async {
    bool locationServiceIsEnabled;
    LocationPermission permission;

    locationServiceIsEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceIsEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions have beenn denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
