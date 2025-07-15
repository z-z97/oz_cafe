class User {
  final String name;
  final String email;
  final String password;
  final String tier;
  final int points;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.tier,
    required this.points,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      tier: json['tier'],
      points: json['points'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'tier': tier,
      'points': points,
    };
  }
}
