import 'package:flutter/cupertino.dart';
import 'package:oz_cofe/services/api_service.dart';
import 'package:oz_cofe/ui/views/home/home_view.dart';
import 'package:oz_cofe/ui/views/login/login_view.dart';
import 'package:oz_cofe/ui/views/loginWithEmail/loginWithEmail_view.dart';
import 'package:oz_cofe/ui/views/register/register_view.dart';
import 'package:oz_cofe/ui/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:oz_cafe_app/services/api_service.dart';
// import 'package:oz_cafe_app/ui/views/home/home_view.dart';

@StackedApp(
  routes: [
     MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: LoginWithEmailView),
    MaterialRoute(page: RegisterView)
  ],
  dependencies: [
     LazySingleton(classType: NavigationService), 
    LazySingleton(classType: ApiService),
    LazySingleton(classType: SnackbarService),
  
  ],
)
class AppSetup {}



