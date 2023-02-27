import 'package:flutter/material.dart';
import 'package:k2dbmoneyapp/core/constant/color.dart';
import 'package:k2dbmoneyapp/core/helpers/helper_notification.dart';

class WebSocket extends StatefulWidget {
  const WebSocket({Key? key}) : super(key: key);
  static const routeName = '/web_socket';

  @override
  State<WebSocket> createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocket> {
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
      body: TestWebSocket(),
    );
  }
}
