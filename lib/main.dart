import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/counter_page.dart';
import 'package:flutter_block/cubits/counter/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'anonymous_route',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: MyHomePage(),
      ),
    );
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
          child: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value: context.read<CounterCubit>(),
                                  child: CounterPage(),
                                )));
                  },
                  child: Text('show counter')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: Text('increment'))
            ],
          );
        }),
      )),
    );
  }
}
