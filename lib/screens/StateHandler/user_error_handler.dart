import 'package:app_social/blocs/user_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:flutter/material.dart';

class UserErrorHandler extends StateHandler {
  @override
  Widget verify<UserState>(UserState state) {
    if (state is UserError) {
      return const Center(child: Text("Error loading profile."));
    }
    return nextHandler!.verify(state);
  }
}
