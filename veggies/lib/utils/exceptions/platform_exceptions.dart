class VPlatformException implements Exception {
  final String code;
   VPlatformException(this.code, );

  String get message{
    switch (code) {
      case 'network_error':
        return 'Network error occurred. Please check your internet connection.';
      case 'too-many-request':
        return 'Too many requests. Please try again later.';
      case 'sign_in_failed':
        return 'Sign in failed. Please check your credentials.';
        case 'session-cookie-expired':
          return 'Session cookie expired. Please sign in again.';
      case 'timeout_error':
        return 'Request timeout. Please try again later.';
      case 'server_error':
        return 'Server error occurred. Please try again later.';
      case 'permission_denied':
        return 'Permission denied. Please grant necessary permissions.';
      case 'file_not_found':
        return 'File not found.';
      case 'invalid_credentials':
        return 'Invalid username or password.';
      case 'database_error':
        return 'Database error occurred. Please try again later.';
      case 'authentication_error':
        return 'Authentication failed. Please check your credentials.';
      case 'location_disabled':
        return 'Location service is disabled. Please enable it in device settings.';
      case 'camera_unavailable':
        return 'Camera is not available on this device.';
      case 'storage_full':
        return 'Storage is full. Please free up some space.';
      case 'payment_failed':
        return 'Payment failed. Please try again or use a different payment method.';
      case 'unknown_error':
        return 'An unknown error occurred. Please try again later.';
      case 'invalid_input':
        return 'Invalid input. Please provide valid data.';
      case 'server_unreachable':
        return 'Server is unreachable. Please try again later.';
      case 'unexpected_response':
        return 'Received unexpected response from server.';
      default:
        return 'Unknown error: $code';
    }
  }

}