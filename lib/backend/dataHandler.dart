import 'package:inteligencia_astral/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inteligencia_astral/backend/authentication.dart';

class User {
  String id = AuthenticationService().getUserId();
  String nick = "";
  String birthdate = "";
  String city = "";

  User({
    required String? id,
    required this.nick,
    required this.birthdate,
    required this.city,   
  });
}

class DataHandler {
  Future<List<User>> fetchUserData() async {
    String userId = AuthenticationService().getUserId();
    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', userId)
        .execute();

    if (response.status == 200) {
      final userData = response.data as List;
      List<User> users = [];

      for (var user in userData) {
        users.add(User(
          id: user['id']?.toString(),
          nick: user['nick'].toString(),
          birthdate: user['birth_date'].toString(),
          city: user['city'].toString(),
        ));
      }

      return users;
    } else {
      // Lide com o erro, se necessário (não consegui lidar)
      return [];
    }
  }
}