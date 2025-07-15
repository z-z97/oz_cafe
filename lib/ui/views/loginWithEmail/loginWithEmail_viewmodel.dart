import 'package:flutter/material.dart';
import 'package:oz_cofe/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';



class LoginWithEmailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // Dummy login check
    if (emailController.text == "test" && passwordController.text == "123") {
      _snackbarService.showSnackbar(message: "Logged in successfully ✅");
    } else {
      _snackbarService.showSnackbar(message: "Invalid credentials ❌");
    }
  }

  void goToRegister() {
   // _navigationService.navigateToRegisterView();
  }
}
