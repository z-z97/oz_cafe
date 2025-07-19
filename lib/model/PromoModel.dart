class PromoModel {
  final String title;
  final String description;
  final double numberOfVocher;
  final List<String> storeIds;

  PromoModel({
    required this.title,
    required this.description,
    required this.storeIds,
    required this.numberOfVocher
  });
}
