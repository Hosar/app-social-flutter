import 'package:app_social/blocs/post_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:flutter/material.dart';

class PostErrorHandler extends StateHandler {
  @override
  Widget verify<PostState>(PostState state) {
    if (state is PostError) {
      return const Center(child: Text("Error loading posts."));
    }
    return nextHandler!.verify(state);
  }
}
