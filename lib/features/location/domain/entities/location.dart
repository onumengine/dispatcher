class Location {
  final double latitude, longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      (other is Location) &&
      (other.latitude == this.latitude) &&
      (other.longitude == this.longitude);

  @override
  int get hashCode => super.hashCode;
}
