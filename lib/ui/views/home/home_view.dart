import 'package:flutter/material.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';


class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Oz Cafe"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text("Promotions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...DummyData.promos.map((promo) => PromoCardWidget(promo: promo)),

            const SizedBox(height: 24),
            const Text("Our Stores", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...DummyData.stores.map((store) => StoreCardWidget(store: store)),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
