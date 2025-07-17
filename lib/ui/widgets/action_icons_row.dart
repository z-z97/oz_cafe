import 'package:flutter/material.dart';

class ActionIconsRow extends StatelessWidget {
  const ActionIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.shopping_bag, 'label': 'Pickup'},
      {'icon': Icons.delivery_dining, 'label': 'Delivery'},
      {'icon': Icons.subscriptions, 'label': 'Subscribe'},
      {'icon': Icons.more_horiz, 'label': 'More'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items.map((item) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE6F0F3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xFF056780),
                child: Icon(item['icon'] as IconData, color: Color(0xFFE6F0F3)),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item['label'].toString(),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      }).toList(),
    );
  }
}

