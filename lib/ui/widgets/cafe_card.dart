import 'package:flutter/material.dart';
import 'package:oz_cofe/model/StoreModel.dart';

class CafeCard extends StatelessWidget {
  final StoreModel store;

  const CafeCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
    
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              store.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(store.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(store.status, style: TextStyle(color: store.status.contains("Open") ? Colors.green : Colors.red)),
                const SizedBox(height: 4),
                Text(store.distance, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
