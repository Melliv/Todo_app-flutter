class Register {
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";

  Map toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      };

}
