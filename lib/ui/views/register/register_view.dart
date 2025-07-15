import 'package:flutter/material.dart';
import 'package:oz_cofe/ui/custom/CustomTextField.dart';
import 'package:oz_cofe/ui/custom/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'register_viewmodel.dart';

class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("Register"), leading: const BackButton()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello, please fill in your personal data completely."),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Full Name',
                controller: viewModel.nameController,
                errorText: viewModel.nameError,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hintText: 'Password',
                controller: viewModel.passwordController,
                obscureText: true,
                errorText: viewModel.passwordError,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hintText: 'Re-enter Password',
                controller: viewModel.confirmPasswordController,
                obscureText: true,
                errorText: viewModel.confirmPasswordError,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hintText: 'Email',
                controller: viewModel.emailController,
                errorText: viewModel.emailError,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Register',
                centerText: true,
                backgroundColor: const Color(0xFF00657D),
                textColor: Colors.white,
                onPressed: viewModel.register,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) => RegisterViewModel();
}
