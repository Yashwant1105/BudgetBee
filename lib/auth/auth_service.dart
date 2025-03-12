import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<String?> signUp(String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
