import 'package:app_social/utils/constants.dart';
import 'package:flutter/material.dart';

class CommonBackground extends StatelessWidget {
  final Widget child;
  const CommonBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.background),
            fit: BoxFit.cover,
          ),
        ),
        child: child);
  }
}
