import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: const Text(
          'K2DB Money',
          style: TextStyle(color: ColorsApp.appBarTextColor),
        ),
      ),
    );
  }
}
