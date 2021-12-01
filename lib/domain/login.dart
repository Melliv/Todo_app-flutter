class Login {
  String email = "";
  String password = "";

  Map toJson() => {
        'email': email,
        'password': password,
      };
}
