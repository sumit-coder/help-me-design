/// `isEmailValid` can be used for check the Email is valid or not
bool isEmailValid(String userEmail) {
  RegExp validateEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  if (validateEmail.hasMatch(userEmail) == true) {
    return true;
  } else {
    return false;
  }
}

/// `isPasswordValid` can be used for check the password is valid or not
bool isPasswordValid(userPassword) {
  RegExp validatePassword = RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~<>]).{8,}$');

  if (validatePassword.hasMatch(userPassword) == true) {
    return true;
  } else {
    return false;
  }
}
