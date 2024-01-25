class AppExtensions {
  specialCharacter(String value) {
    bool hasSpecialCharacters = value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasSpecialCharacters;
  }

  isNumericCharacter(String value) {
    final bool isNumeric = value.contains(RegExp('[0-9]'));

    return isNumeric;
  }

  isLowerCaseCharacter(String value) {
    final bool isLowerCase = value.contains(RegExp("(?:[^a-z]*[a-z]){1}"));

    return isLowerCase;
  }

  isUpperCaseCharacter(String value) {
    final bool isUpperCase = value.contains(RegExp("(?:[^A-Z]*[A-Z]){1}"));
    return isUpperCase;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
