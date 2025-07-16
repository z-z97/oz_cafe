import 'package:flutter/material.dart';
import 'package:oz_cofe/app/app.locator.dart';
import 'package:oz_cofe/app/app.router.dart';
import 'package:oz_cofe/model/users.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<DummyUserService>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? nameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void register() {
    clearErrors();

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    bool hasError = false;

    if (name.isEmpty) {
      nameError = "Name is required";
      hasError = true;
    }
     if(email.isEmpty){
      nameError = "Email is required";
      hasError = true;
     }

    if (email.isNotEmpty && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      emailError = "Invalid email format";
      hasError = true;
    }

    if (password.length < 6) {
      passwordError = "Password must be at least 6 characters";
      hasError = true;
    }

    if (password != confirmPassword) {
      confirmPasswordError = "Passwords do not match";
      hasError = true;
    }

    if (_userService.isEmailTaken(email)) {
      emailError = "Email already registered";
      hasError = true;
    }

    if (hasError) {
      notifyListeners();
      return;
    }

    _userService.registerUser(
      UserModel(
        name: name,
        email: email,
        password: password,
        tier: 'Gold',
        points: 100,
      ),
    );

    _navigationService.navigateToLoginWithEmailView();
    _snackbarService.showSnackbar(message: "Registration successful 🎉");
  }

  void clearErrors() {
    nameError = null;
    emailError = null;
    passwordError = null;
    confirmPasswordError = null;
  }
}
