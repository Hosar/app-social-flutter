import 'package:app_social/blocs/post_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:flutter/material.dart';

class PostLoadingHandler extends StateHandler {
  @override
  Widget verify<PostState>(PostState state) {
    if (state is PostLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return nextHandler!.verify(state);
  }
}
