import 'package:flutter/material.dart';

import 'listbuku.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '123200169',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: halamanList(),
    );
  }
}
