import 'package:dispatcher/ui/atoms/service_tile.dart';
import 'package:flutter/material.dart';

class ServiceSelectionPage extends StatelessWidget {
  const ServiceSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black54,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: SizedBox(),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'What would you like to do?',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff2f2f2f),
                  ),
                ),
              ),
              SizedBox(height: 36),
              ServiceTile(
                title: 'Send something',
                subtitle: 'We\'ll pick up and drop off your items',
              ),
              SizedBox(
                height: 14,
              ),
              ServiceTile(
                title: 'Buy something',
                subtitle: 'We\'ll purchase and deliver whatever you need',
              ),
              Expanded(
                flex: 19,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
