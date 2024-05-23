class VValidation {

  //Empty text validation
  static String? validateEmptytext(String?fieldName, String?value){
    if (value == null || value.isEmpty) {
      return  "$fieldName  is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

// regular expression for email validation
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regExp.hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }
    if (!value.contains(RegExp(r'[!@#$%^&*()><,.`\|/?]'))) {
      return "Password must contain at least one special character";
    }
    return null;
  }

// validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    if (value.length < 10) {
      return "Phone number must be at least 10 characters long";
    }
    // regular expression for validating phone number according to the country code of India
    RegExp regExp = RegExp(r'^(?:(?:\+|00)91(\s|-|\.)?|0)?[789]\d{9}$');
    if (!regExp.hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }
}
