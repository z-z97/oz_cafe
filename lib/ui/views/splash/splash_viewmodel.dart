import 'package:oz_cofe/app/app.locator.dart';
import 'package:oz_cofe/app/app.router.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:oz_cofe/ui/views/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
    

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user_name')!.isNotEmpty) {
      _navigationService.replaceWithHomeView();
    } else {
      await Future.delayed(const Duration(seconds: 5));
      _navigationService.replaceWithLoginView();
    }
  }

  void onStartTap() {
    _navigationService.replaceWithLoginView();
  }
}
