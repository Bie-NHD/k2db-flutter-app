import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/views/components/screens/home/home_main.dart';
import 'package:k2dbmoneyapp/views/web_socket.dart';

final Map<String, WidgetBuilder> routes = {
  WebSocket.routeName: (context) => const WebSocket(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
