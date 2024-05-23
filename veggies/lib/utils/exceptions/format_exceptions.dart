class VFormatException implements Exception {
  final String message;

  //default constructor with generic error message
  VFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input']);

  factory VFormatException.fromMessage(String message) {
    return VFormatException(message);
  }

  String get formattedMessage => message;

  //create a format exception from a specific error code
  factory VFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return VFormatException(
            'The email address format is invalid. Please enter valid email address');
      case 'invalid-phone-number-format':
        return VFormatException(
            'The phone number format is invalid. Please enter valid phone number');
      case 'invalid-date-format':
        return VFormatException(
            'The date format is invalid. Please enter valid date');
      case 'invalid-url-format':
        return VFormatException(
            'The url format is invalid. Please enter valid url');
      case 'invalid-credit-card-format':
        return VFormatException(
            'The credit card format is invalid. Please enter valid credit card number');
      case 'invalid-numeric-format':
        return VFormatException(
            'The numeric format is invalid. Please enter valid numeric value');
      case 'invalid-currency-format':
        return VFormatException(
            'The currency format is invalid. Please enter valid currency value');
      default:
        return VFormatException(
            'An unexpected format error occurred. Please check your input');
    }
  }
}
