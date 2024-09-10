import 'package:flutter/material.dart';

abstract class StateHandler {
  StateHandler? nextHandler;

  StateHandler setNextHandler(StateHandler handler) {
    nextHandler = handler;
    return handler;
  }

  Widget verify<T>(T state);
}
