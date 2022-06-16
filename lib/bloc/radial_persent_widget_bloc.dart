import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MyEvent {}

class ChangeSlider extends MyEvent {
  final double percent;

  ChangeSlider(this.percent);
}

class RadialPersentWidgetBloc extends Bloc<MyEvent, double> {
  @override
  double state = 0;
  RadialPersentWidgetBloc(double initialState) : super(initialState) {
    on<ChangeSlider>(
      ((event, emit) {
        //print(event.percent);
        emit(state = event.percent);
      }),
    );
  }

  void changeSlider(ChangeSlider event) {
    emit(state = event.percent);
  }
}
