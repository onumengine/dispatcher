class Position {
  double? latitude, longitude;

  @override
  bool operator ==(Object other) {
    return ((other is Position) &&
        (other.latitude == this.latitude) &&
        (other.longitude == this.longitude));
  }

  @override
  int get hashCode => super.hashCode;
}
