class StringConfigs {
  static Map<String, String Function(Object)> validationMessagesName = {
    'required': (error) => 'The name must not be empty',
  };

  static Map<String, String Function(Object)> validationMessagesEmail = {
    'required': (error) => 'The email must not be empty',
    'email': (error) => 'The email value must be a valid email'
  };

  static Map<String, String Function(Object)> validationMessagesPassword = {
    'required': (error) => 'The password must not be empty',
    'minLength': (error) => 'The password must have at least 8 characters'
  };
}
