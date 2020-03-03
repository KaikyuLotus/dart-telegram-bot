class Location {
  double longitude;
  double latitude;

  Location({this.longitude, this.latitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Location(longitude: json['longitude'], latitude: json['latitude']);
  }
}
