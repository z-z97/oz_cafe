import 'package:flutter/material.dart';
import 'package:oz_cofe/app/app.locator.dart';
import 'package:oz_cofe/app/app.router.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginWithEmailViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<DummyUserService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  Future<void> loginWithEmail() async {
    clearErrors();

    final email = emailController.text.trim();
    final password = passwordController.text;

    bool hasError = false;

    if (email.isEmpty) {
      emailError = "Email is required";
      hasError = true;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      emailError = "Invalid email format";
      hasError = true;
    }

    if (password.isEmpty) {
      passwordError = "Password is required";
      hasError = true;
    }

    if (hasError) {
      notifyListeners();
      return;
    }
final user = await _userService.login(email, password);

    if (user != null) {
      _snackbarService.showSnackbar(message: "Welcome, ${user.name} 👋");
       _navigationService.replaceWithMainNavigationView();
      // navigate to home or dashboard if needed
    } else {
      passwordError = "Invalid credentials ❌";
      notifyListeners();
    }
  }

  void clearErrors() {
    emailError = null;
    passwordError = null;
  }

  void navigateToRegister() {
    _navigationService.navigateToRegisterView();
  }
}
