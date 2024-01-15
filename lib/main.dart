import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/blocs/color/color_bloc.dart';
import 'package:flutter_block/blocs/counter/counter_bloc.dart';
import 'package:flutter_block/observer/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
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
      title: 'generated_route',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                      value: _counterCubit,
                      child: MyHomePage(),
                    ));
          case '/counter':
            return MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                      value: _counterCubit,
                      child: CounterPage(),
                    ));
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('generated_route'),
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
