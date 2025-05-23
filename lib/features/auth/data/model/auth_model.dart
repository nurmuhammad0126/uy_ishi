class AuthModel {
  final String? id;
  final String username;
  final String email;
  final String password;

  AuthModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'].toString(),
      username: json['username'].toString(),
      email: json['email'].toString(),
      password: json['password'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username.toString(),
      'email': email.toString(),
      'password': password.toString(),
    };
  }
}
