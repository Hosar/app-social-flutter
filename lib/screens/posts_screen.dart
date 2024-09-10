import 'package:app_social/blocs/post_bloc.dart';
import 'package:app_social/screens/StateHandler/post_error_handler.dart';
import 'package:app_social/screens/StateHandler/post_loaded_handler.dart';
import 'package:app_social/screens/StateHandler/post_loading_handler.dart';
import 'package:app_social/screens/StateHandler/post_not_loaded_handler.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StateHandler handler = PostLoadingHandler();
    handler.setNextHandler(PostErrorHandler());
    handler.setNextHandler(PostNotLoadedHandler());
    handler.setNextHandler(PostLoadedHandler());

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          return handler.verify(state);
        }),
      ),
    );
  }
}
