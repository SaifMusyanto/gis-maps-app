class FaskesModel {
  final String name;
  final String type;
  final String provider;
  final String district;
  final double latitude;
  final double longitude;

  FaskesModel({
    required this.name,
    required this.type,
    required this.provider,
    required this.district,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() {
    return 'FaskesModel{name: $name, type: $type, provider: $provider, district: $district, latitude: $latitude, longitude: $longitude}';
  }
}
