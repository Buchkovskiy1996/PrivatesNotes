import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_private_notes/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_private_notes/view/login_view.dart';
import 'package:my_private_notes/view/verify_email.view.dart';

import 'notes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          // if (user?.emailVerified ?? false) {
          //если левая часть существует то возьми ее, если нет то справа
          // print('You are a verifird user');
          // return const Text('main page after login');
          // } else {
          // print('You need to verify your email first');
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: ((context) => const VerifyEmailView())));
          // return const VerifyEmailView();
          // }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
