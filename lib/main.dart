import 'package:flutter/material.dart';
import 'package:http_request/page_list_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 6 - 123200065',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageListUsers(),
    );
  }
}