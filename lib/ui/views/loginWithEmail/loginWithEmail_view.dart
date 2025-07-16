import 'package:flutter/material.dart';
import 'package:oz_cofe/ui/widgets/CustomTextField.dart';
import 'package:oz_cofe/ui/widgets/custom_button.dart';
import 'package:oz_cofe/ui/views/loginWithEmail/loginWithEmail_viewmodel.dart';
import 'package:stacked/stacked.dart';


class LoginWithEmailView extends StackedView<LoginWithEmailViewModel> {
  const LoginWithEmailView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("Login"), leading: const BackButton()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              CustomTextField(
                hintText: 'Email',
                controller: viewModel.emailController,
                errorText: viewModel.emailError,
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                hintText: 'Password',
                controller: viewModel.passwordController,
                obscureText: true,
                errorText: viewModel.passwordError,
                prefixIcon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Login',
                centerText: true,
                backgroundColor: const Color(0xFF00657D),
                textColor: Colors.white,
                onPressed: viewModel.loginWithEmail,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?"),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet? "),
                  GestureDetector(
                    onTap: viewModel.navigateToRegister,
                    child: const Text(
                      "Register Here",
                      style: TextStyle(color: Colors.orange),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginWithEmailViewModel viewModelBuilder(BuildContext context) => LoginWithEmailViewModel();
}
