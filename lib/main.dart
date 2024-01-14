import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/cubits/theme/theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
        child: Builder(builder: (context) {
          return MaterialApp(
            title: 'cubit Payload',
            debugShowCheckedModeBanner: false,
            theme: context.watch<ThemeCubit>().state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(),
          );
        }),
      );
    });
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

            context.read<ThemeCubit>().changeTheme(randomInt);
          },
        ),
      ),
    );
  }
}
