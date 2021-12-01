String? validateEmail(String value) {
  String? _msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\].,;:\s@"]+(\.[^<>()[\],;:\s@"]+)*)|(".+"))@(([^<>()[\],;:\s@"]+\.)+[^<>()[\],;:\s@"]{2,})$');
  if (value.isEmpty) {
    _msg = "Your email is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Please provide a valid emal address";
  }
  return _msg;
}

String? validatePassword(String value) {
  String? _msg;
  RegExp regex = new RegExp(
      r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$');
  if (value.isEmpty) {
    _msg = "Password is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Password requirements: \n" + 
     "- At least one upper case English letter \n" +
     "- At least one digit \n" +
     "- At least one special character \n" +
     "- Minimum eight in length";
  }
  return _msg;
}
