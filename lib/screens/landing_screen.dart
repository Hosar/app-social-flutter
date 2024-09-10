import 'package:app_social/widgets/common_background.dart';
import 'package:flutter/material.dart';
import './user_profile_screen.dart';
import './posts_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const UserProfileScreen(),
    const PostsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
        ],
      ),
      body: CommonBackground(
        child: _pages[_currentIndex],
      ),
    ));
  }
}
