class StoreModel {
  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final String status;
  final String distance;
  final double rating;
  final String openTime;
  final String closTime;

  StoreModel( {
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.status,
    required this.distance,
    required this.rating,
    required this.openTime,
    required this.closTime,
  });
}
