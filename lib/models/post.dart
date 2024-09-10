import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String id;
  final String userId;
  final String userName;
  final String content;
  final DateTime createdAt;
  final List<String> likes;

  Post({
    required this.id,
    required this.userId,
    required this.userName,
    required this.content,
    required this.createdAt,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
