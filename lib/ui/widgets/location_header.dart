import 'package:flutter/material.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.white),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            'Bahrain Financial Harbour',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
