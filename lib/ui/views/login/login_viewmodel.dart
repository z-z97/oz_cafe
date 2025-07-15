import 'package:oz_cofe/app/app.locator.dart';
import 'package:oz_cofe/app/app.router.dart';
import 'package:oz_cofe/model/users.dart';
import 'package:oz_cofe/services/DummyUserService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
final _userService = locator<DummyUserService>();




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
          _userService.registerUser(
      UserModel(
        name: googleUser.displayName??"",
        email: googleUser.email,
        password: "",
        tier: 'Gold',
        points: 100,
      ),
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
       _navigationService.navigateToRegisterView();
  }

  void loginWithEmail() {
      _navigationService.navigateToLoginWithEmailView();
  }
}
