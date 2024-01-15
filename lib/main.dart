import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/counter_page.dart';
import 'package:flutter_block/cubits/counter/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'anonymous_route',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: MyHomePage(),
              ),
          '/counter': (context) => BlocProvider.value(
                value: _counterCubit,
                child: CounterPage(),
              )
        });
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('anonymous_route'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: Text('show counter')),
          ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: Text('increment'))
        ],
      )),
    );
  }
}
