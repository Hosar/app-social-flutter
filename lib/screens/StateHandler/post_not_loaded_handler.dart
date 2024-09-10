import 'package:app_social/blocs/post_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:flutter/material.dart';

class PostNotLoadedHandler extends StateHandler {
  @override
  Widget verify<PostState>(PostState state) {
    if (state is! PostLoaded) {
      return Container();
    }
    return nextHandler!.verify(state);
  }
}
