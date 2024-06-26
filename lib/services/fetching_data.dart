import 'dart:convert';
import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

class GetUsersApiService {
  static const String url = 'https://reqres.in/api/users?page=2';

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List users = json.decode(response.body)['data'];
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
