class LocationEntity {
  final double latitude, longitude;

  LocationEntity({
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      (other is LocationEntity) &&
      (other.latitude == this.latitude) &&
      (other.longitude == this.longitude);

  @override
  int get hashCode => super.hashCode;
}
