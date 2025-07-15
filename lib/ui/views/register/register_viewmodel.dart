import 'package:flutter/material.dart';
import 'package:oz_cofe/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class RegisterViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  void register() {
    if (passwordController.text != confirmPasswordController.text) {
      _snackbarService.showSnackbar(message: "Passwords do not match ❌");
      return;
    }

    _snackbarService.showSnackbar(message: "Registered Successfully ✅");
  }
}
