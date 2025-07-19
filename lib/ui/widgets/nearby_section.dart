import 'package:flutter/material.dart';
import 'package:oz_cofe/model/StoreModel.dart';
import 'package:oz_cofe/ui/widgets/cafe_card.dart';

class NearbySection extends StatelessWidget {
  final List<StoreModel> stores;
  final String title;

  const NearbySection({super.key, required this.stores, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
             Expanded(
              child: Text(
              title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: const Text(
                "See All",
                style: TextStyle(color: Color(0xFFFF8A00)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: stores.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return CafeCard(store: stores[index]);
            },
          ),
        ),
      ],
    );
  }
}
