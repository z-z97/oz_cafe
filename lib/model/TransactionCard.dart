import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oz_cofe/model/orderModel.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('yyyy - MM - dd').format(transaction.date);
    final products = DummyData.getproductForTransaction(transaction);
    final orderTitle = products.map((e) => e.name).join(', ');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cafe name + date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.cafeName,
                style: const TextStyle(
                  color: Color(0xFF056780),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dateFormatted,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Order name
          Text(
            orderTitle.length > 40 ? '${orderTitle.substring(0, 40)}...' : orderTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Pickup method
          Row(
            children: [
              const Icon(Icons.storefront_outlined, size: 16, color: Colors.teal),
              const SizedBox(width: 4),
              Text(transaction.pickupMethod.isEmpty ? "Self Pickup" : transaction.pickupMethod),
            ],
          ),
          const SizedBox(height: 6),

          // Total menu and price
          Text(
            'Total ${transaction.totalMenu} Menu   •   BHD${transaction.totalPrice}',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 6),

          // Status + button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.status == 'Complete' ? 'Order Completed' : 'In Progress',
                style: const TextStyle(color: Colors.grey),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF056780)),
                  foregroundColor: Color(0xFF056780),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle "Order Again"
                },
                child: const Text("Order Again"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
