import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/cubits/color/color_cubit.dart';
import 'package:flutter_block/cubits/counter/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            colorCubit: context.read<ColorCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Event Payload',
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
      backgroundColor: context.watch<ColorCubit>().state.color,
      appBar: AppBar(
        title: Text('cubit2cubit'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<ColorCubit>().changeColor();
              },
              child: Text("change color")),
          Text("${context.watch<CounterCubit>().state.counter}",
              style: TextStyle(fontSize: 52)),
          ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().changeCounter();
              },
              child: Text('increment'))
        ],
      )),
    );
  }
}
