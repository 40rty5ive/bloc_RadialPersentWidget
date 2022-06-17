import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/colors_radial_persent_widget_bloc.dart';
import 'bloc/radial_persent_widget_bloc.dart';
import 'widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RadialPersentWidgetBloc>(
          create: (context) => RadialPersentWidgetBloc(0),
        ),
        BlocProvider<ColorsRadialPersentWidgetBloc>(
          create: (context) => ColorsRadialPersentWidgetBloc(Colors.white),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
          ),
        ),
        home: const Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}
