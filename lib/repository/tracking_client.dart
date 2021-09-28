import 'dart:async';

import 'package:http/http.dart' as http;

class TrackingClient {
  http.Client client = http.Client();

  Future<void> broadcastLocation() async {
    try {
      var response = await client.get(Uri.parse('http://127.0.0.1:8000/'));
      print(response);
    } on Exception catch (error) {
      print('ERROR: $error');
    }
  }
}
