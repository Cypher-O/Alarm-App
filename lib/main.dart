import 'package:alarm_app/home.dart';
import 'package:flutter/material.dart';

import 'add_alarm.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/add-alarm': (context) => const AddAlarm(),
        },
        theme: ThemeData(
            fontFamily: 'SourceSansPro',
            primaryColor: const Color(0xFF000F1C),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xFF50A6D6))
            // backgroundColor: const Color(0x50A6D6),
            ),
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
