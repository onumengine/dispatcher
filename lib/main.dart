import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dispatcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'dispatcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentPosition = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your location is',
            ),
            Text(
              currentPosition,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          determineLocation().then(
            (value) {
              setState(() {
                currentPosition = value.toString();
              });
            },
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
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
