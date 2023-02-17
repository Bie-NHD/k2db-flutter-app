import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/routes.dart';
import 'package:k2dbmoneyapp/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      title: 'K2DB Money',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: const HomeScreen(),
    );
  }
}
