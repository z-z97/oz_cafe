import 'package:flutter/material.dart';
import 'package:oz_cofe/ui/widgets/action_icons_row.dart';
import 'package:oz_cofe/ui/widgets/location_header.dart';
import 'package:oz_cofe/ui/widgets/loyalty_card.dart';
import 'package:oz_cofe/ui/widgets/nearby_section.dart';
import 'package:oz_cofe/ui/widgets/promo_banner.dart';

import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
      BuildContext context, HomeViewModel viewModel, Widget? child) {
    return SafeArea(
      child: SingleChildScrollView(
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
               padding: const EdgeInsets.all(16),
              
              decoration: BoxDecoration(color: Color(0xFF056780),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15) ,bottomRight: Radius.circular(15) )),
              child: Column(
                children: [
                  const LocationHeader(),
                   const SizedBox(height: 16),
            const LoyaltyCard(),
             ],
              )),
              Container(
                 padding: const EdgeInsets.all(16),child: Column(children: [   SizedBox(height: 24),
             ActionIconsRow(),
            const SizedBox(height: 24),
            PromoBanner(),
            const SizedBox(height: 24),
           NearbySection(),],),)
         
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
