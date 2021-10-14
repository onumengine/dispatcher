abstract class LocationRepository {
  Future<dynamic> determinePosition() async {}
  Future<void> broadcastPosition() async {}
}
