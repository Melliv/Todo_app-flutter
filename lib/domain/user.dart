class User {
  String? firstName;
  String? lastName;
  String? token;

  User({this.firstName, this.lastName, this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        firstName: responseData["firstName"],
        lastName: responseData["lastName"],
        token: responseData["token"]);
  }
}
