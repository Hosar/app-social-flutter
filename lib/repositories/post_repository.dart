import 'dart:convert';
import 'package:app_social/models/post.dart';
import 'package:app_social/utils/constants.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPost(String postId);
}

class PostRepositoryImpl implements PostRepository {
  List<Post> _posts = [];

  PostRepositoryImpl() {
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final String jsonString = await rootBundle.loadString(Constants.postsUrl);
    final List<dynamic> jsonList = json.decode(jsonString);
    _posts = jsonList.map((json) => Post.fromJson(json)).toList();
  }

  @override
  Future<List<Post>> getPosts() async {
    await _ensureLoaded();
    return _posts;
  }

  @override
  Future<Post> getPost(String postId) async {
    await _ensureLoaded();
    return _posts.firstWhere((post) => post.id == postId);
  }

  Future<void> _ensureLoaded() async {
    if (_posts.isEmpty) {
      await _loadPosts();
    }
  }
}
