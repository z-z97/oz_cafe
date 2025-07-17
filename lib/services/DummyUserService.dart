import 'package:shared_preferences/shared_preferences.dart';
import 'package:oz_cofe/model/users.dart';

class DummyUserService {
  UserModel? _loggedInUser;
  final List<UserModel> _users = [];

  List<UserModel> get users => _users;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name');
    await prefs.setString('user_name', "");
    final email = prefs.getString('user_email');
    final password = prefs.getString('user_password');
    final tier = prefs.getString('user_tier');
    final points = prefs.getInt('user_points');

    if (name != null &&
        email != null &&
        password != null &&
        tier != null &&
        points != null) {
      _loggedInUser = UserModel(
        name: name,
        email: email,
        password: password,
        tier: tier,
        points: points,
      );
    }
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      final user = _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );

      _loggedInUser = user;
      await _saveUserToPrefs(user);

      return user;
    } catch (_) {
      return null;
    }
  }
Future<UserModel?> getuser() async {
  final prefs = await SharedPreferences.getInstance();
  final name = prefs.getString('user_name');
  final email = prefs.getString('user_email');
  final password = prefs.getString('user_password');
  final tier = prefs.getString('user_tier');
  final points = prefs.getInt('user_points');

  if (name != null &&
      email != null &&
      password != null &&
      tier != null &&
      points != null) {
    return UserModel(
      name: name,
      email: email,
      password: password,
      tier: tier,
      points: points,
    );
  }

  return null;
}

  bool isEmailTaken(String email) {
    return _users.any((user) => user.email == email);
  }

  void registerUser(UserModel user) {
    _users.add(user);
  }

  bool isLoggedIn() => _loggedInUser != null;

  UserModel? get currentUser => _loggedInUser;

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
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
