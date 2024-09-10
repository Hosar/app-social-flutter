import 'package:app_social/blocs/post_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:app_social/widgets/post_card.dart';
import 'package:flutter/material.dart';

class PostLoadedHandler extends StateHandler {
  @override
  Widget verify<PostState>(PostState state) {
    final posts = state is PostLoaded ? state.posts : [];
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return PostCard(post: post);
      },
    );
  }
}
