import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_private_notes/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                //если левая часть существует то возьми ее, если нет то справа
                print('You are a verifird user');
              } else {
                print('You need to verify your email first');
              }

              return const Text('main page after login');
            default:
              return Text('Loading');
          }
        },
      ),
    );
  }
}
