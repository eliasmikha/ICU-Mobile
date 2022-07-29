/// Regexes and validators that be used in text fields
class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^.{5,30}$',
  );

  static final RegExp _nameRegExp = RegExp(r'^(?!\s*$).+');
  static final RegExp _fullNameRegExp = RegExp(r'^(?!\s*$).+ (?!\s*$).+');

  static bool isNotEmptyString(String? string) {
    return string != null ? string.trim() != "" : false;
  }

  static bool isValidEmail(String? email) {
    return email != null ? _emailRegExp.hasMatch(email) : false;
  }

  static bool hasCharacters(String text) {
    String modText = text.replaceAll(" ", "");
    return modText.length > 0;
  }

  static bool isValidPassword(String? password) {
    return password != null ? _passwordRegExp.hasMatch(password) : false;
  }

  static bool isValidName(String? name) {
    return name != null ? _nameRegExp.hasMatch(name) : false;
  }

  static bool isValidFullName(String? name) {
    return name != null ? _fullNameRegExp.hasMatch(name) : false;
  }

  static bool isValidConfirmPassword(String? password, String? confirmPassword) {
    return (password != null && confirmPassword != null)
        ? (password == confirmPassword)
        : false;
  }

  static bool isValidPhoneNumber(String? phone) {
    if (phone == null) return false;
    // Only store the actual digits
    final newPhone = phone.replaceAll(RegExp("[^0-9]"), "");
    return newPhone.isNotEmpty &&
        ((newPhone.startsWith('09') && newPhone.length == 10));
  }

  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }
}
