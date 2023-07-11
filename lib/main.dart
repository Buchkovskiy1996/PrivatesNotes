import 'package:flutter/material.dart';
import 'package:my_private_notes/view/login_view.dart';
import 'package:my_private_notes/view/register_view.dart';
import 'package:my_private_notes/view/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        // primaryColor: Colors.grey,
        scaffoldBackgroundColor: Color(0XffF6F8FC)),
    home: const LoginView(),
  ));
}
