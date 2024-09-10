import 'package:app_social/blocs/user_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:app_social/screens/StateHandler/user_error_handler.dart';
import 'package:app_social/screens/StateHandler/user_loaded_handler.dart';
import 'package:app_social/screens/StateHandler/user_loading_handler.dart';
import 'package:app_social/screens/StateHandler/user_not_loaded_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final StateHandler handler = UserLoadingHandler();
    handler.setNextHandler(UserErrorHandler());
    handler.setNextHandler(UserNotLoadedHandler());
    handler.setNextHandler(UserLoadedHandler());
    return Center(
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return handler.verify(state);
      }),
    );
  }
}
