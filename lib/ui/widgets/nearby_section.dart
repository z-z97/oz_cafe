import 'package:flutter/material.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';
import 'package:oz_cofe/ui/widgets/cafe_card.dart';

class NearbySection extends StatelessWidget {
  const NearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    final stores = DummyData.stores;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Expanded(
              child: Text("Nearby", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Text("See All", style: TextStyle(color: Colors.orange)),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stores.length,
            itemBuilder: (context, index) {
              return CafeCard(store: stores[index]);
            },
          ),
        ),
      ],
    );
  }
}
