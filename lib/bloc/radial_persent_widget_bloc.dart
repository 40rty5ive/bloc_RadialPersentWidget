// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MyEvent {}

class ChangeSlider extends MyEvent {
  final double percent;

  ChangeSlider(this.percent);
}

class RadialPersentWidgetBloc extends Bloc<MyEvent, double> {
  @override
  double state = 0;
  RadialPersentWidgetBloc(double initialState) : super(initialState);

  void changeSlider(ChangeSlider event) {
    emit(state = event.percent);
  }
}
