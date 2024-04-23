// ignore_for_file: use_super_parameters

import 'package:flutter/widgets.dart';

//* Classe para gerenciar estado da tela
abstract class BaseController<T> extends ValueNotifier<T> {
  BaseController(T value) : super(value);
  T get currentState => value;

  void emit(T value) {
    if (!hasListeners) return;
    super.value = value;
  }
}
