import 'package:oz_cofe/app/app.locator.dart';
import 'package:oz_cofe/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  // ✅ Dummy accounts
  final List<Map<String, String>> _dummyUsers = [
    {'email': 'test@ozcafe.com', 'password': '123456'},
    {'email': 'admin@ozcafe.com', 'password': 'adminpass'},
  ];

  void loginWithEmailCredentials(String email, String password) {
    final user = _dummyUsers.firstWhere(
      (u) => u['email'] == email && u['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      _snackbarService.showSnackbar(
        message: "Welcome, $email!",
        duration: const Duration(seconds: 2),
      );
      _navigationService.navigateToHomeView();
    } else {
      _snackbarService.showSnackbar(
        message: "Invalid email or password",
        duration: const Duration(seconds: 2),
        title: 'Login Failed',
      );
    }
  }

  final _googleSignIn = GoogleSignIn();

  Future<void> loginWithGoogle() async {
    setBusy(true);
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        _snackbarService.showSnackbar(message: "Login cancelled.");
        setBusy(false);
        return;
      }

      _snackbarService.showSnackbar(
        message: "Hello ${googleUser.displayName} (${googleUser.email})",
      );
      _navigationService.navigateToHomeView();
    } catch (e) {
      _snackbarService.showSnackbar(
        message: "Login failed: $e",
        title: "Error",
      );
    }
    setBusy(false);
  }
  // not ready
Future<void> loginWithFacebook() async {
  setBusy(true);

  try {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();

      _snackbarService.showSnackbar(
        message: "Hello ${userData['name']} (${userData['email'] ?? 'No email'})",
      );

      _navigationService.navigateToHomeView();
    } else if (result.status == LoginStatus.cancelled) {
      _snackbarService.showSnackbar(message: "Login cancelled by user.");
    } else {
      _snackbarService.showSnackbar(
        message: "Facebook login failed: ${result.message}",
        title: "Error",
      );
    }
  } catch (e) {
    _snackbarService.showSnackbar(
      message: "Login error: $e",
      title: "Exception",
    );
  }

  setBusy(false);
}


  void loginWithApple() {
    _snackbarService.showSnackbar(message: "Logged in with Apple");
  }

  void goToRegister() {
    //   _navigationService.navigateToRegisterView();
  }

  void loginWithEmail() {
    //  _navigationService.navigateToEmailLoginView();
  }
}
