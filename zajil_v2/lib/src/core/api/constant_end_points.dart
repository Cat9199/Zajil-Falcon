class Constants {
  static String? token;
  static String language = 'ar';
  static String phoneNumber = '';
  static String baseUrl = "https://api.call-gpt.tech";
}

class EndPoints {
  static const String login = '/api/v1/login/';
  static const String register = '/api/v1/register/';

  static const String textToVoice = '/api/v1/order/voice/';
  static const String textToText = '/api/v1/order/chat/';
  static const String getAllProducts = '/api/v1/get_all_products';
  static const String getAllOrders = '/api/v1/get_all_orders';

  static const String closeOrder = '/api/v1/order/close/';
}
