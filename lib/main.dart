import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/blocs/color/color_bloc.dart';
import 'package:flutter_block/blocs/counter/counter_bloc.dart';
import 'package:flutter_block/observer/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (context) => ColorBloc()),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(
            colorBloc: context.read<ColorBloc>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'bloc2bloc',
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.color,
      appBar: AppBar(
        title: Text('bloc2bloc'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<ColorBloc>().add(ChangeColorEvent());
              },
              child: Text("change color")),
          Text("${context.watch<CounterBloc>().state.counter}",
              style: TextStyle(fontSize: 52)),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(ChangeCounterEvent());
              },
              child: Text('increment'))
        ],
      )),
    );
  }
}
