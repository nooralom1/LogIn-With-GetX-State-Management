import 'dart:developer';

class SignInService {
  static Future<bool> signIn() async {
    try {
      log("---------------Yeah -----------");
      await Future.delayed(const Duration(seconds: 2));
      return true;
    } catch (e) {
      log("Error :$e");
    }
    return false;
  }
}
