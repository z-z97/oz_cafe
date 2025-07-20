import 'package:flutter/material.dart';
import 'package:oz_cofe/model/TransactionCard.dart';
import 'package:oz_cofe/ui/views/Features/Profile/Profile_viewmodel.dart';
import 'package:oz_cofe/ui/views/Features/Transaction/Transaction_viewmodel.dart';
import 'package:oz_cofe/ui/widgets/logout_button.dart';
import 'package:oz_cofe/ui/widgets/profile_header.dart';
import 'package:oz_cofe/ui/widgets/profile_menu.dart';

import 'package:stacked/stacked.dart';

class ProfilePage extends StackedView<ProfileViewModel> {
  const ProfilePage({super.key});



  @override
  ProfileViewModel viewModelBuilder(BuildContext context) =>
      ProfileViewModel();
      
        @override
        Widget builder(BuildContext context, ProfileViewModel viewModel, Widget? child) {
             return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          ProfileHeader(),
          Expanded(
            child: ProfileMenu(),
          ),
        ],
      ),
    );
        }
}
