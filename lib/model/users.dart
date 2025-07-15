class UserModel {
  final String name;
  final String email;
  final String password;
  final String tier;
  final int points;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.tier,
    required this.points,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
