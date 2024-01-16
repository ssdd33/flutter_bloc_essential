import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/blocs/counter/counter_bloc.dart';
import 'package:flutter_block/blocs/theme/theme_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc())
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              title: 'bloc_hydrated',
              theme: state.appTheme == AppTheme.light
                  ? ThemeData.light()
                  : ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              home: MyHomePage());
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
        title: Text('hydrated bloc '),
      ),
      body: Center(
        child: Text(
          "${context.watch<CounterBloc>().state.counter}",
          style: TextStyle(fontSize: 64),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ChangeThemeEvent());
            },
            child: Icon(Icons.brightness_4_rounded)),
        SizedBox(width: 5),
        FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: Icon(Icons.add)),
        SizedBox(width: 5),
        FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: Icon(Icons.remove)),
        SizedBox(width: 5),
        FloatingActionButton(
            onPressed: () {
              HydratedBloc.storage.clear();
            },
            child: Icon(Icons.delete_forever))
      ]),
    );
  }
}
