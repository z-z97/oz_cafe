import 'package:flutter/material.dart';
import 'package:oz_cofe/model/StoreModel.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';
import 'package:oz_cofe/ui/widgets/cafe_card.dart';

class StoreSection extends StatelessWidget {
  final String title;

  const StoreSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final List<StoreModel> stores = DummyData.stores;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("See All", style: TextStyle(color: Colors.orange)),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 230,
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
