import 'package:debestech_course_project/counter_bloc/counter_bloc.dart';
import 'package:debestech_course_project/pages/bloc/welcome.dart';
import 'package:debestech_course_project/pages/bloc/welcome_bloc.dart';
import 'package:debestech_course_project/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WelcomeBloc(),
          ),
          BlocProvider(
            // lazy: false, // lazy false so a yin load load
            create: (context) => CounterBloc(),
          ),
        ],
        child: ScreenUtilInit(
            builder: (context, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      appBarTheme: AppBarTheme(
                          elevation: 0, backgroundColor: Colors.white)),
                  home: Welcome(),
                  routes: {
                    "myHomePage": (context) =>
                        const MyHomePage(title: "Home Page"),
                    "signIn": (context) => const SignIn(),
                  },
                )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${BlocProvider.of<CounterBloc>(context).state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "heroTag1",
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context).add(Increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: "heroTag2",
              onPressed: () =>
                  BlocProvider.of<CounterBloc>(context).add(Decrement()),
              tooltip: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}






