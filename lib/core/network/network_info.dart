import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get deviceIsConnected;
}

class NetworkInfoImplementation implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImplementation(this.connectionChecker);

  @override
  Future<bool> get deviceIsConnected => connectionChecker.hasConnection;
}
