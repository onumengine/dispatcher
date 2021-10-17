class Position {
  final double latitude, longitude;

  Position({
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      (other is Position) &&
      (other.latitude == this.latitude) &&
      (other.longitude == this.longitude);

  @override
  int get hashCode => super.hashCode;
}
