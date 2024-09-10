import 'package:app_social/blocs/user_bloc.dart';
import 'package:app_social/screens/StateHandler/state_handler.dart';
import 'package:app_social/screens/landing_styles.dart';
import 'package:flutter/material.dart';

class UserNotLoadedHandler extends StateHandler {
  @override
  Widget verify<UserState>(UserState state) {
    if (state is! UserLoaded) {
      return Center(
          child: Container(
        color: Colors.white30,
        child: const Text(
          "Error loading profile.",
          style: LandingStyles.subHeaderStyle,
        ),
      ));
    }
    return nextHandler!.verify(state);
  }
}
