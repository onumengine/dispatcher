import 'dart:async';

import 'package:http/http.dart' as http;

class TrackingClient {
  http.Client client = http.Client();

  Future<void> broadcastLocation(String locationData) async {
    try {
      // todo
      // var response = await client.post();
    } on Exception catch (error) {
      // todo
    }
  }
}
