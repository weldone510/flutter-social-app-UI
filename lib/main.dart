import 'package:flutter/material.dart';
import 'package:socialapp/screens/home_screen.dart';
import 'package:socialapp/screens/login_screen.dart';
import 'package:socialapp/widgets/animatedcontainer.dart';

void main()=>runApp((MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
