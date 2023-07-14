import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_private_notes/widgets/button_style.dart';
import 'package:my_private_notes/widgets/style_text.dart';
import 'package:my_private_notes/widgets/widgets_textField.dart';
import 'dart:developer' as devtools show log;

import '../constants/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

//текстовий контроллер
class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const TextStyleTitle(text: 'Sign Up'),
          const SizedBox(
            height: 50,
          ),
          // TextField(
          //   controller: _email,
          //   enableSuggestions: false,
          //   autocorrect: false,
          //   keyboardType:
          //       TextInputType.emailAddress, // тип ввода текста
          //   decoration: const InputDecoration(
          //       hintText: 'Enter your email here'),
          // ),
          CustomTextField(
              obscureText: false,
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter your email here'),
          // TextField(
          //   controller: _password,
          //   obscureText: true, //скрываем пароль
          //   enableSuggestions: false, //подсказки снизу
          //   autocorrect: false, //автозамена
          //   decoration: const InputDecoration(
          //       hintText: 'Enter your password here'),
          // ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              obscureText: true,
              controller: _password,
              keyboardType: TextInputType.text,
              hintText: 'Enter your password here'),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            // child: TextButton(
            //   onPressed: () async {
            //     final email = _email.text; // регистрация email
            //     final password = _password.text; //регистрация пароля
            //     //  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password) //аудификация firebase
            //     try {
            //       final UserCredential = await FirebaseAuth.instance
            //           .signInWithEmailAndPassword(
            //               email: email,
            //               password: password); //войти в систему
            //       print(UserCredential);
            //     } on FirebaseAuthException catch (e) {
            //       if (e.code == 'user-not-found') {
            //         print('User not found');
            //       } else if (e.code == 'wrong-password') {
            //         print('wrong password');
            //         print(e.code);
            //       }
            //     }
            //   },
            //   style: TextButton.styleFrom(
            //     backgroundColor: Colors.black,
            //     foregroundColor: Colors.white,
            //     minimumSize: Size(double.infinity, 50),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   ),
            //   child: Text('login'),
            // ),
            child: CustomButton(
              text: 'Login',
              onPressed: () async {
                final email = _email.text; // регистрация email
                final password = _password.text; //регистрация пароля
                //  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password) //аудификация firebase
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  ); //войти в систему
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    notesRoute,
                    (route) => false,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    devtools.log('User not found');
                  } else if (e.code == 'wrong-password') {
                    devtools.log('wrong password');
                    devtools.log(e.code);
                  }
                }
              },
            ),
          ),

          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Not regidtered yet? Register here!'))
        ],
      ),
    );
  }
}
