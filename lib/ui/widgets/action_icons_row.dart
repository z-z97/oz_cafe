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
      children: items
          .map(
            (item) => Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal[50],
                  child: Icon(item['icon'] as IconData, color: Color(0xFF056780)),
                ),
                const SizedBox(height: 4),
                Text(item['label'].toString(), style: const TextStyle(fontSize: 12)),
              ],
            ),
          )
          .toList(),
    );
  }
}
