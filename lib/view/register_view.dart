import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_private_notes/widgets/button_style.dart';
import 'package:my_private_notes/widgets/style_text.dart';
import 'package:my_private_notes/widgets/widgets_textField.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          const TextStyleTitle(text: 'Register'),
          const SizedBox(
            height: 50,
          ),
          // Material(
          //   elevation: 20,
          //   shadowColor: Color(0xffE4F1F4),
          //   borderRadius: BorderRadius.circular(20),
          //   child: TextField(
          //     controller: _email,
          //     enableSuggestions: false,
          //     autocorrect: false,
          //     keyboardType:
          //         TextInputType.emailAddress, // тип ввода текста
          //     decoration: InputDecoration(
          //       hintText: 'Enter your email here',
          //       hintStyle: TextStyle(color: Colors.grey),
          //       filled: true,
          //       fillColor: Color.fromARGB(255, 255, 255, 255),
          //       focusedBorder: border,
          //       enabledBorder: border,
          //     ),
          //   ),
          // ),
          CustomTextField(
              obscureText: false,
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter your email here'),
          const SizedBox(
            height: 20,
          ),
          // Material(
          //   elevation: 20,
          //   shadowColor: Color(0xffE4F1F4),
          //   borderRadius: BorderRadius.circular(20),
          //   child: TextField(
          //     controller: _password,
          //     obscureText: true, //скрываем пароль
          //     enableSuggestions: false, //подсказки снизу убрать
          //     autocorrect: false, //автозамена отключаем
          //     decoration: InputDecoration(
          //       hintText: 'Enter your password here',
          //       hintStyle: const TextStyle(color: Colors.grey),
          //       filled: true,
          //       fillColor: const Color.fromARGB(255, 255, 255, 255),
          //       focusedBorder: border,
          //       enabledBorder: border,
          //     ),
          //   ),
          // ),
          CustomTextField(
              controller: _password,
              keyboardType: TextInputType.text,
              obscureText: true,
              hintText: 'Enter your password here'),
          const SizedBox(
            height: 30,
          ),
          // TextButton(
          //   onPressed: () async {
          //     final email = _email.text;
          //     final password = _password.text;
          //     try {
          //       final UserCredential = await FirebaseAuth.instance
          //           .createUserWithEmailAndPassword(
          //               email: email, password: password);
          //       print(UserCredential);
          //     } on FirebaseAuthException catch (e) {
          //       if (e.code == 'weak-password') {
          //         print('Weak password');
          //       } else if (e.code == 'email-already-in-use') {
          //         print('Email is alredy in use');
          //       } else if (e.code == 'invalid-email') {
          //         print('Invalid email entered');
          //       }
          //     }
          //   },
          //   child: const Text('Sign Up'),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: CustomButton(
              text: 'Register',
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  final UserCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  print(UserCredential);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('Weak password');
                  } else if (e.code == 'email-already-in-use') {
                    print('Email is alredy in use');
                  } else if (e.code == 'invalid-email') {
                    print('Invalid email entered');
                  }
                }
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login/',
                  (route) => false,
                );
              },
              child: const Text('Already registered? Login here!')),
        ],
      ),
    );
  }
}
