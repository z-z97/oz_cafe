import 'package:flutter/material.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';
import 'package:oz_cofe/ui/widgets/cafe_card.dart';
import 'package:oz_cofe/ui/widgets/nearby_section.dart';
import 'package:oz_cofe/ui/widgets/promo_card.dart';
import 'package:stacked/stacked.dart';
import 'promo_viewmodel.dart';
import 'package:oz_cofe/model/PromoModel.dart';

class PromoPage extends StackedView<PromoViewModel> {
  const PromoPage({super.key});

  @override
  Widget builder(BuildContext context, PromoViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            const Text(
              "Promo",
              style: TextStyle(
                color: Color(0xFF056780),
              ),
            ),
            const SizedBox(width: 16),
            // 👇 FutureBuilder to load user points
            FutureBuilder(
              future: viewModel.userFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
                  return const Text(
                    "0 pts",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  );
                } else {
                  final user = snapshot.data!;
                  return Row(
                    children: [
                      Image.asset('assets/images/Vector.png', height: 20, width: 20),
                      Text(
                        '${user.points}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold , color: Colors.black),
                      ),
                      const Text(
                        ' pts',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: viewModel.promos.length,
        itemBuilder: (context, index) {
          PromoModel promo = viewModel.promos[index];
          final stores = viewModel.getStoresForPromo(promo);

          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PromoCard(promo: promo),
                const SizedBox(height: 12),
                NearbySection(stores: stores, title: 'Store'),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  PromoViewModel viewModelBuilder(BuildContext context) => PromoViewModel();
}
