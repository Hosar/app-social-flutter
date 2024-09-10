import 'package:app_social/blocs/user_bloc.dart';
import 'package:app_social/models/user.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:app_social/widgets/user_details.dart';
import 'package:flutter/material.dart';

class UserLoadedHandler extends StateHandler {
  @override
  Widget verify<UserState>(UserState state) {
    final user = state is UserLoaded
        ? state.user
        : User(friendIds: [], name: "", id: "", profilePicUrl: "");
    return UserDetails(user: user);
  }
}
