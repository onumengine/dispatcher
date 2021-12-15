import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get deviceIsConnected;
}

class NetworkInfoImplementation implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImplementation(this.connectionChecker);

  @override
  Future<bool> get deviceIsConnected => connectionChecker.hasConnection;
}
