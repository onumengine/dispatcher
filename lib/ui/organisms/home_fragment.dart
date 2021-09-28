import 'package:dispatcher/repository/tracking_client.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your location is',
          ),
          // Text(
          //   currentPosition,
          //   style: Theme.of(context).textTheme.headline4,
          //   textAlign: TextAlign.center,
          // ),
          FutureBuilder(
            future: determineLocation(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    textAlign: TextAlign.center,
                  );
                } else if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  );
                }
              }
              return Text(
                '...',
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<Position> determineLocation() async {
    print('DetermineLocation has been called');
    bool locationServiceIsEnabled;
    LocationPermission permission;
    Position position;

    locationServiceIsEnabled = await Geolocator.isLocationServiceEnabled();
    if (!locationServiceIsEnabled) {
      print("ERROR!");
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("ERROR!");
        return Future.error('Location permissions have been denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("ERROR!");
      return Future.error('Location permissions are permanently denied');
    }

    position = await Geolocator.getCurrentPosition();
    print(position.toString());
    return position;
  }
}
