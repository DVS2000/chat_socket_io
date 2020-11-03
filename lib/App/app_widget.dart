import 'package:flutter/material.dart';
import 'package:mobile_socket/App/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Chat',
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: HomePage(),
    );
  }
}