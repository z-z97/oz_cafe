import 'package:oz_cofe/app/app.locator.dart';
import 'package:oz_cofe/app/app.router.dart';
import 'package:oz_cofe/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 5)); 
    _navigationService.navigateToLoginView(); 
  }
    void onStartTap() {
    _navigationService.navigateToLoginView();
  }
}
