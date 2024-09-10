import 'dart:convert';
import 'package:app_social/models/user.dart';
import 'package:app_social/utils/constants.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class UserRepository {
  Future<User> getUser(String userId);
  Future<List<User>> getFriends(String userId);
}

class UserRepositoryImpl implements UserRepository {
  List<User> _users = [];

  UserRepositoryImpl() {
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final String jsonString = await rootBundle.loadString(Constants.usersUrl);
    final List<dynamic> jsonList = json.decode(jsonString);
    _users = jsonList.map((json) => User.fromJson(json)).toList();
  }

  @override
  Future<User> getUser(String userId) async {
    await _ensureLoaded();
    return _users.firstWhere((user) => user.id == userId);
  }

  @override
  Future<List<User>> getFriends(String userId) async {
    await _ensureLoaded();
    final user = await getUser(userId);
    return _users.where((u) => user.friendIds.contains(u.id)).toList();
  }

  Future<void> _ensureLoaded() async {
    if (_users.isEmpty) {
      await _loadUsers();
    }
  }
}
