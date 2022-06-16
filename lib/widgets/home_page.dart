import 'package:custom_paint/widgets/radial_persent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/radial_persent_widget_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final sliderBloc = BlocProvider.of<RadialPersentWidgetBloc>(context);
    return BlocBuilder<RadialPersentWidgetBloc, double>(
        builder: (BuildContext context, state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: RadialPersentWidget(
                percent: state,
                fillColor: const Color.fromRGBO(28, 34, 86, 1.0),
                lineColor: const Color.fromRGBO(161, 233, 97, 1.0),
                freeColor: const Color.fromRGBO(56, 80, 72, 1.0),
                lineWidth: 8,
                child: Text(
                  '${(state * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Slider(
              value: state,
              max: 1,
              onChanged: (double value) {
                // setState(() {
                //   _currentSliderValue = state;
                // });
                //sliderBloc.add(ChangeSlider(value));
                sliderBloc.changeSlider(ChangeSlider(value));
              },
            ),
          ],
        ),
      );
    });
  }
}
