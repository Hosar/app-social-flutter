import 'package:app_social/models/post.dart';
import 'package:app_social/repositories/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PostEvent {}

class LoadPostsEvent extends PostEvent {}

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded(this.posts);
}

class PostError extends PostState {}

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;
  PostBloc(this._postRepository) : super(PostInitial()) {
    on<LoadPostsEvent>((event, emit) async {
      emit(PostLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        final posts = await _postRepository.getPosts();
        emit(PostLoaded(posts));
      } catch (_) {
        emit(PostError());
      }
    });
  }
}
