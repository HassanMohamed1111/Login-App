class LoginModel {
  final String username;
  final String email;
  final String password;

  LoginModel(
      {required this.username, required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json["username"],
      email: json["email"],
      password: json["password"],
    );
  }
}
