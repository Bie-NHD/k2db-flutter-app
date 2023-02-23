import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/views/screens/authen/splash_srceen.dart';
import 'package:k2dbmoneyapp/views/screens/home/home_main.dart';
import 'package:k2dbmoneyapp/views/screens/user/user_main.dart';
import 'package:k2dbmoneyapp/views/web_socket.dart';

final Map<String, WidgetBuilder> routes = {
  WebSocket.routeName: (context) => const WebSocket(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  UserScreen.routeName: (context) => const UserScreen(),
};
