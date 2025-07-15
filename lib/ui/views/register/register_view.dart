import 'package:flutter/material.dart';
import 'package:oz_cofe/ui/custom/CustomTextField.dart';
import 'package:stacked/stacked.dart';

import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register"), leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hello, please fill in your personal data completely."),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Full Name',
              controller: viewModel.nameController,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hintText: 'Password',
              controller: viewModel.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hintText: 'Re-enter Password',
              controller: viewModel.confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hintText: 'Email (optional)',
              controller: viewModel.emailController,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: viewModel.register,
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) => RegisterViewModel();
}
