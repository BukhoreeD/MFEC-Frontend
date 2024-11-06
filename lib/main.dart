import 'package:flutter/material.dart';
import 'package:mfec_frontend/constants.dart';
import 'package:mfec_frontend/screens/login_screen.dart';
import 'package:mfec_frontend/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(primaryColor),
      ),
      home:  const LoginScreen(),
      // home:  const RegisterScreen(),
    );
  }
}