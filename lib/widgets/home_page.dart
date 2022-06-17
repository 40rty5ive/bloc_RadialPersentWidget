import 'package:custom_paint/widgets/radial_persent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/colors_radial_persent_widget_bloc.dart';
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
    final colorsBloc = BlocProvider.of<ColorsRadialPersentWidgetBloc>(context);
    return BlocBuilder<RadialPersentWidgetBloc, double>(
        bloc: sliderBloc,
        builder: (BuildContext context, state) {
          return BlocBuilder<ColorsRadialPersentWidgetBloc, Color>(
            bloc: colorsBloc,
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: RadialPersentWidget(
                        percent: sliderBloc.getPersent,
                        fillColor: colorsBloc.getFillColor,
                        lineColor: colorsBloc.getLineColor,
                        freeColor: colorsBloc.getFreeColor,
                        lineWidth: 8,
                        child: Text(
                          '${(sliderBloc.getPersent * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Slider(
                        value: sliderBloc.getPersent,
                        max: 1,
                        onChanged: (double value) {
                          sliderBloc.changeSlider(ChangeSlider(value));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            colorsBloc.buttonPresed(ButtonPressEvent.fill),
                        child: const Text('Фон'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            colorsBloc.buttonPresed(ButtonPressEvent.line),
                        child: const Text('Лінія'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            colorsBloc.buttonPresed(ButtonPressEvent.freeLine),
                        child: const Text('Вільна лінія'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            colorsBloc.buttonPresed(ButtonPressEvent.reset),
                        child: const Text('Скинути'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
