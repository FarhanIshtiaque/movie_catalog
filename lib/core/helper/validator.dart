class Validator {
  static String? validateEmail(String value) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Please enter an email";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value.length < 8) {
      return "Password must be 8 character";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value != password) {
      return "Password did not match";
    } else {
      return null;
    }
  }

  static String? validateMobile(String value) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter your phone number';
    }
    // else if (!regExp.hasMatch(value)) {
    //   return 'Please enter valid mobile number';
    // }
    else if (value.length != 14) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }

  static String? validateFirstName(String value) {
    if (value.isEmpty) {
      return "Please enter a valid first name";
    } else {
      return null;
    }
  }

  static String? validateLastName(String value) {
    if (value.isEmpty) {
      return "Please enter a valid last name";
    } else {
      return null;
    }
  }

  static String? validateOTP(String value) {
    if (value.isEmpty) {
      return 'Please enter OTP';
    }
    if (value.length != 4) {
      return 'OTP must be 4 digits';
    }
    return null; // Return null if validation passes
  }

  static String? validateMessage(String value) {
    if (value.length < 8) {
      return "Please enter a valid message";
    } else {
      return null;
    }
  }
}
