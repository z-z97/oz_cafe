import 'package:shared_preferences/shared_preferences.dart';
import 'package:oz_cofe/model/users.dart';

class DummyUserService {
  UserModel? _loggedInUser;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name');
    final email = prefs.getString('user_email');
    final password = prefs.getString('user_password');
    final tier = prefs.getString('user_tier');
    final points = prefs.getInt('user_points');

    if (email != null && password != null) {
      _loggedInUser = UserModel(
        name: name ?? '',
        email: email,
        password: password,
        tier: tier ?? 'Gold',
        points: points ?? 0,
      );
    }
  }

  Future<UserModel?> login(String email, String password) async {
    // شرط وهمي
    if (email == "test@oz.com" && password == "123456") {
      final user = UserModel(
        name: "Test User",
        email: email,
        password: password,
        tier: "Gold",
        points: 100,
      );
      _loggedInUser = user;
      await _saveUserToPrefs(user);
      return user;
    }
    return null;
  }

  Future<void> registerUser(UserModel user) async {
    _loggedInUser = user;
    await _saveUserToPrefs(user);
  }

  bool isLoggedIn() => _loggedInUser != null;

  UserModel? get currentUser => _loggedInUser;

  Future<void> logout() async {
    _loggedInUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  bool isEmailTaken(String email) {
    return false; 
  }

  Future<void> _saveUserToPrefs(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', user.name);
    await prefs.setString('user_email', user.email);
    await prefs.setString('user_password', user.password);
    await prefs.setString('user_tier', user.tier);
    await prefs.setInt('user_points', user.points);
  }
}
