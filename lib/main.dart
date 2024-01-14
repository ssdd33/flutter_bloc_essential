import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Event Payload',
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(),
          );
        },
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
        title: Text('theme'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'change Theme',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            int randomInt = Random().nextInt(10);
            print(randomInt);

            context.read<ThemeBloc>().add(ChangeThemeEvent(ranInt: randomInt));
          },
        ),
      ),
    );
  }
}
