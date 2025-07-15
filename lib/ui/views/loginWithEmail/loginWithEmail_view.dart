import 'package:flutter/material.dart';
import 'package:oz_cofe/ui/custom/CustomTextField.dart';
import 'package:oz_cofe/ui/views/loginWithEmail/loginWithEmail_viewmodel.dart';
import 'package:stacked/stacked.dart';


class LoginWithEmailView extends StackedView<LoginWithEmailViewModel> {
  const LoginWithEmailView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Email or Phone Number',
              controller: viewModel.emailController,
              prefixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hintText: 'Password',
              controller: viewModel.passwordController,
              obscureText: true,
              prefixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: viewModel.login,
              child: const Text("Login"),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text("Forgot Password?"),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account yet? "),
                GestureDetector(
                  onTap: viewModel.goToRegister,
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
    );
  }

  @override
  LoginWithEmailViewModel viewModelBuilder(BuildContext context) => LoginWithEmailViewModel();
}
