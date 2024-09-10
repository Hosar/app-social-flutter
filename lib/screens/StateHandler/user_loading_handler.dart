import 'package:app_social/blocs/user_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:flutter/material.dart';

class UserLoadingHandler extends StateHandler {
  @override
  Widget verify<UserState>(UserState state) {
    if (state is UserLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return nextHandler!.verify(state);
  }
}
