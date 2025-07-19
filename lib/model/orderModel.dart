
class TransactionModel {
  final String cafeName;
  final String orderName;
  final int totalMenu;
  final double totalPrice;
  final DateTime date;
  final String status;
  final List<String> products;
  final String pickupMethod;

  TransactionModel( {
    required this.products,
    required this.cafeName,
    required this.orderName,
    required this.pickupMethod,
    required this.totalMenu,
    required this.totalPrice,
    required this.date,
    required this.status,
  });
}
