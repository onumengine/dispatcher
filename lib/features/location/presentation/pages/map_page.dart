import 'package:dispatcher/features/location/presentation/components/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  /*
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
  */

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
}
