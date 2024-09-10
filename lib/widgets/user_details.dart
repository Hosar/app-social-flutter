import 'package:app_social/models/user.dart';
import 'package:app_social/screens/landing_styles.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final User user;
  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'Social App',
            style: LandingStyles.headerStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.profilePicUrl),
              radius: 50,
            ),
            const SizedBox(height: 30),
            Text(user.name, style: LandingStyles.subHeaderStyle),
            const SizedBox(height: 30),
            Text(
              "Friends: ${user.friendIds.length}",
              style: LandingStyles.subHeaderStyle,
            ),
          ]),
        ),
      ],
    );
  }
}
