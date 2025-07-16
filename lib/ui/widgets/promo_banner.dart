import 'package:flutter/material.dart';

import 'package:oz_cofe/services/DummyFeaturesService.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final promos = DummyData.promos;

    return SizedBox(
      height: 120,
      child: PageView.builder(
        itemCount: promos.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          final promo = promos[index];
          return Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/images/promo_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                promo.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
