import 'package:flutter/material.dart';
import 'package:oz_cofe/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';



class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF3E6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/AppLogo.png',
                  height: 40,
                ),
              ),
              const SizedBox(height: 24),

              Image.asset(
                'assets/images/coffee_cups.png',
                height: 180,
              ),
              const SizedBox(height: 24),

              CustomButton(
                text: 'Email or Phone Number',
                icon: Icons.email,
                backgroundColor: const Color(0xFF00657D),
                textColor: Colors.white,
                onPressed: viewModel.loginWithEmail,
              ),
              const SizedBox(height: 12),

              CustomButton(
                text: 'Google',
                assetIconPath: 'assets/images/google.png',
                backgroundColor: const Color(0xFFFBE8C6),
                textColor: Colors.black87,
                onPressed: viewModel.loginWithGoogle,
              ),
              const SizedBox(height: 12),

              CustomButton(
                text: 'Facebook',
                assetIconPath: 'assets/images/facebook.png',
                backgroundColor: const Color(0xFF1877F2),
                textColor: Colors.white,
                onPressed: viewModel.loginWithFacebook,
              ),
              const SizedBox(height: 12),

              CustomButton(
                text: 'Apple',
                assetIconPath: 'assets/images/apple.png',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                onPressed: viewModel.loginWithApple,
              ),
              const SizedBox(height: 24),

              TextButton(
                onPressed: viewModel.goToRegister,
                child: const Text.rich(
                  TextSpan(
                    text: "Don’t have an account yet? ",
                    style: TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "Register Here",
                        style: TextStyle(
                          color: Color(0xFFF3C981),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
