import 'package:debestech_course_project/common/routes/routes.dart';
import 'package:debestech_course_project/common/values/color.dart';
import 'package:debestech_course_project/counter_bloc/counter_bloc.dart';
import 'package:debestech_course_project/global.dart';
import 'package:debestech_course_project/pages/application/application_page.dart';
import 'package:debestech_course_project/pages/bloc_provider.dart';
import 'package:debestech_course_project/pages/welcome/welcome.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // providers: AppBlocProviders.allBlocProviders,
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      appBarTheme: AppBarTheme(
                          iconTheme: IconThemeData(
                              color: AppColors
                                  .primaryText), // for show back button
                          elevation: 0,
                          backgroundColor: Colors.white)),
                  // home: const Welcome(),
                  onGenerateRoute: AppPages.GenerateRouteSetting,
                  // home: ApplicationPage(),
                  // initialRoute: "/",
                  // routes: {
                  //   "myHomePage": (context) =>
                  //       const MyHomePage(title: "Home Page"),
                  //   "signIn": (context) => const SignIn(),
                  //   "register": (context) => const Register(),
                  // },
                )));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: BlocBuilder<CounterBloc, CounterState>(
//           builder: (context, state) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '${BlocProvider.of<CounterBloc>(context).state.counter}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             FloatingActionButton(
//               heroTag: "heroTag1",
//               onPressed: () =>
//                   BlocProvider.of<CounterBloc>(context).add(Increment()),
//               tooltip: 'Increment',
//               child: const Icon(Icons.add),
//             ),
//             FloatingActionButton(
//               heroTag: "heroTag2",
//               onPressed: () =>
//                   BlocProvider.of<CounterBloc>(context).add(Decrement()),
//               tooltip: 'decrement',
//               child: const Icon(Icons.remove),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
