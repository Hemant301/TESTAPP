import 'package:flutter/material.dart';

import 'auth/homepage.dart';
import 'auth/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: ('/sign_up'),
        routes: {
          "/sign_up": (context) => signUpPage(),
          "/homepage": (context) => HomePage(),
        });
  }
}
