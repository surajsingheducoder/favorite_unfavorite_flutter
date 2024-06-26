import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/favorite_service.dart';
import '../services/fetching_data.dart';

class UserProvider with ChangeNotifier {

  List<User> _users = [];
  List<int> _favoriteIds = [];
  List<User> get users => _users;
  List<User> get favoriteUsers => _users.where((user) => _favoriteIds.contains(user.id)).toList();

  UserProvider() {
    _fetchUsers();
    _loadFavorites();
  }

  void _fetchUsers() async {
    _users = await GetUsersApiService.fetchUsers();
    notifyListeners();
  }

  void _loadFavorites() async {
    _favoriteIds = await FavoriteService.getFavorites();
    notifyListeners();
  }

  void toggleFavorite(int userId) async {
    if (_favoriteIds.contains(userId)) {
      await FavoriteService.removeFavorite(userId);
    } else {
      await FavoriteService.saveFavorite(userId);
    }
    _loadFavorites();
  }
}
