class Validators {
  String? email(String? email, [message = 'This email has wrong format.']) {
    if (isEmpty(email) != null) {
      return 'This field is empty';
    }

    final emailRegex = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);

    if (emailRegex) {
      return null;
    }
    return message;
  }

  String? isEmpty(String? value, [message = 'This field is empty.']) {
    if (value == null || value == '') {
      return message;
    }
    return null;
  }

  String? passwordMatch(String? password, String? confirmPassword,
      [message = 'The password must be equal.']) {
    if (password == confirmPassword) {
      return null;
    }
    return message;
  }

  String? minCharacters(String? value,
      [message = 'Please enter at least 6 characters.']) {
    if (isEmpty(value) != null) {
      return 'This field is empty';
    }

    if (value!.length < 6) {
      return message;
    }
    return null;
  }
}
