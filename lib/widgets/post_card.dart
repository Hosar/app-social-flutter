import 'package:app_social/models/post.dart';
import 'package:app_social/screens/landing_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    var createdAt = DateFormat('yyyy-MM-dd').format(post.createdAt);
    return Card(
      child: ListTile(
        title: Text(post.content),
        subtitle: Text("Posted at: $createdAt"),
        onTap: () {
          debugPrint("Opening post detail screen...");
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(post.userName),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(post.content, style: LandingStyles.textDetailsStyle),
                  Text(createdAt, style: LandingStyles.textDetailsStyle),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
