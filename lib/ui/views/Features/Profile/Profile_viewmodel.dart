import 'dart:math';
import 'package:oz_cofe/app/app.locator.dart';
import 'package:oz_cofe/app/app.router.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:stacked/stacked.dart';
import 'package:oz_cofe/services/DummyFeaturesService.dart';
import 'package:oz_cofe/model/orderModel.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  Future<void> loginWithGoogle() async {
    DummyUserService().logout();
    _navigationService.navigateToLoginView();
  }
}
