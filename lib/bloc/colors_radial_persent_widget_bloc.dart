// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math';

enum ButtonPressEvent {
  fill,
  line,
  freeLine,
  reset,
}

class ColorsRadialPersentWidgetBloc extends Bloc<ButtonPressEvent, Color> {
  ColorsRadialPersentWidgetBloc(Color initialState) : super(initialState);

  @override
  Color state = Colors.black;

  Color _fillColor = const Color.fromRGBO(28, 34, 86, 1.0);
  Color _lineColor = const Color.fromRGBO(161, 233, 97, 1.0);
  Color _freeColor = const Color.fromRGBO(56, 80, 72, 1.0);

  Color get getFillColor => _fillColor;
  Color get getLineColor => _lineColor;
  Color get getFreeColor => _freeColor;

  void buttonPresed(ButtonPressEvent event) {
    if (event == ButtonPressEvent.fill) {
      emit(
        _fillColor = Color.fromRGBO(Random().nextInt(257),
            Random().nextInt(257), Random().nextInt(257), 1.0),
      );
    } else if (event == ButtonPressEvent.line) {
      emit(
        _lineColor = Color.fromRGBO(Random().nextInt(257),
            Random().nextInt(257), Random().nextInt(257), 1.0),
      );
    } else if (event == ButtonPressEvent.freeLine) {
      emit(
        _freeColor = Color.fromRGBO(Random().nextInt(257),
            Random().nextInt(257), Random().nextInt(257), 1.0),
      );
    } else if (event == ButtonPressEvent.reset) {
      emit(
        _fillColor = const Color.fromRGBO(28, 34, 86, 1.0),
      );
      emit(
        _lineColor = const Color.fromRGBO(161, 233, 97, 1.0),
      );
      emit(
        _freeColor = const Color.fromRGBO(56, 80, 72, 1.0),
      );
    }
  }
}
