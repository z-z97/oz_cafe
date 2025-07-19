import 'package:flutter/material.dart';
import 'package:oz_cofe/ui/views/Features/PromoPage/PromoPage_view.dart';
import 'package:oz_cofe/ui/views/Features/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'main_navigation_viewmodel.dart';

class MainNavigationView extends StackedView<MainNavigationViewModel> {
  const MainNavigationView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MainNavigationViewModel viewModel,
    Widget? child,
  ) {
    final screens = const [
      HomeView(),
      PromoPage(),
      // OrdersView(),
      // ProfileView(),
    ];

return Scaffold(
  backgroundColor: const Color(0xFFFDF3E9),
  body: Stack(
    children: [
      Positioned.fill(
        child: IndexedStack(
          index: viewModel.currentIndex,
          children: screens,
        ),
      ),

      Positioned(
        left: 16,
        right: 16,
        bottom: 16,
        child: Container(
          margin:  EdgeInsets.symmetric(horizontal: 50, vertical: 0),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: viewModel.currentIndex,
            selectedItemColor: const Color(0xFF056780),
            unselectedItemColor: Colors.grey,
            onTap: viewModel.setIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Loyalty"),
              BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Orders"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
      ),
    ],
  ),
);

  }

  @override
  MainNavigationViewModel viewModelBuilder(BuildContext context) =>
      MainNavigationViewModel();
}
