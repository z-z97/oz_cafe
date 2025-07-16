class TransactionModel {
  final String storeName;
  final String orderDetails;
  final String pickupMethod;
  final String date;
  final String status;

  TransactionModel({
    required this.storeName,
    required this.orderDetails,
    required this.pickupMethod,
    required this.date,
    required this.status,
  });
}
