import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String defaultString = "workout_";
  static String signIn = "${defaultString}signIn";
  static String isIntro = "${defaultString}isIntro";
  static String isFirstTime = "${defaultString}isFirstTime";
  static String language = "Language";

  static String isDark = 'isDark';
  static String token = 'token';
  static String userData = 'UserData';

  static String tokenExpireDate = 'TokenExpireDate';
  static String phoneNumber = 'PhoneNumber';

  static String profileImage = 'profileImage';
  SharedPreferences prefs;
  PrefData(
    this.prefs,
  );
  void setIsSignIn(bool isFav) async {
    prefs.setBool(signIn, isFav);
  }

  void setTokenExpireDate(String date) async {
    prefs.setString(tokenExpireDate, date);
  }

  void setPhoneNumber(String Number) async {
    prefs.setString(phoneNumber, Number);
  }

  Future<String> getPhoneNumber() async {
    return prefs.getString(phoneNumber) ?? '';
  }

  Future<bool> getIsSignIn() async {
    return prefs.getBool(signIn) ?? false;
  }

  void setIsIntro(bool isFav) async {
    prefs.setBool(isIntro, isFav);
  }

  getIsIntro() async {
    return prefs.getBool(isIntro) ?? true;
  }

  void setIsFirstTime(bool isFav) async {
    prefs.setBool(isFirstTime, isFav);
  }

  getIsFirstTime() async {
    return prefs.getBool(isFirstTime) ?? true;
  }

  void setThemeMode(bool isFav) async {
    prefs.setBool(isDark, isFav);
  }

  Future<bool> getThemeMode() async {
    return prefs.getBool(isDark) ?? false;
  }

  void setToken(String accessToken) async {
    prefs.setString(token, accessToken);
  }

  Future<String> getToken() async {
    return prefs.getString(token) ?? '';
  }

  void setLanguage(String language) async {
    await prefs.setString(language, language);
  }

  Future<String> getLanguage() async {
    return prefs.getString(language) ?? 'en';
  }

  Future<String> getTokenExpireDate() async {
    return prefs.getString(tokenExpireDate) ?? '';
  }

  void deleteTokenExpireDate() async {
    prefs.remove(
      tokenExpireDate,
    );
  }
}
