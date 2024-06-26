import 'package:shared_preferences/shared_preferences.dart';

class FavoriteService {

  static Future<void> saveFavorite(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.add(userId.toString());
    await prefs.setStringList('favorites', favorites);
  }

  static Future<void> removeFavorite(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.remove(userId.toString());
    await prefs.setStringList('favorites', favorites);
  }

  static Future<List<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList('favorites') ?? [];
    return favorites.map((id) => int.parse(id)).toList();
  }
}
