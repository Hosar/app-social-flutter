import 'package:app_social/models/user.dart';
import 'package:app_social/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent {}

class LoadUserEvent extends UserEvent {}

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserError extends UserState {}

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitial()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        debugPrint("Loading user...");
        final user = await _userRepository.getUser('2');
        debugPrint("User loaded.");
        emit(UserLoaded(user));
      } catch (_) {
        emit(UserError());
      }
    });
  }
}
