import 'package:flutter/material.dart';
import 'blog_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // BlogListScreen Is the Intial Screeen Shown When The App is open.


      home: BlogListScreen(),
    );
  }
}
