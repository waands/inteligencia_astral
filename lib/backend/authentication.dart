import 'package:inteligencia_astral/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  bool isLoggedIn() {
    final session = supabase.auth.currentSession;
    return session != null;
  }

  String getUserId() {
    return supabase.auth.currentSession?.user?.id.toString() ?? '';
  }

  Future<void> signout() async {
    await supabase.auth.signOut();
  }

  Future<void> signup({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    AuthResponse response = await supabase.auth
        .signUp(email: email, password: password, data: data);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    if (res.session != null) {
      print("Login bem-sucedido para o usuário: ${res.user!.email}");
    } else {
      print("Login mal-sucedido");
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
