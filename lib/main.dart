import 'package:flutter/material.dart';
import 'package:my_private_notes/view/home_page.dart';
import 'package:my_private_notes/view/login_view.dart';
import 'package:my_private_notes/view/notes_page.dart';
import 'package:my_private_notes/view/register_view.dart';
import 'package:my_private_notes/view/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        // primaryColor: Colors.grey,
        scaffoldBackgroundColor: const Color(0XffF6F8FC)),
    home: const HomePage(),
    routes: {
      '/startScreen/': (context) => const StartScreen(),
      '/register/': (context) => const RegisterView(),
      '/login/': (context) => const LoginView(),
      '/notes/': (context) => const NotesView(),
    },
  ));
}
