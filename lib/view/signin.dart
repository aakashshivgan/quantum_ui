import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:quantum_ui/controller/firebase_auth.dart';

import '../widgets/icon.dart';
import '../widgets/textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.74,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            top: 10,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
            child: Column(children: [
              const Text(
                'SignIn into your account',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                obsecure: false,
                controller: emailController,
                label: 'Email',
                hint: 'JohnDoe@gmail.com',
                icon: const Icon(Icons.mail),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                obsecure: true,
                controller: passwordController,
                label: 'Password',
                hint: 'password',
                icon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Forgot Password ?',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Login with',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      AuthController.authInstance.signInWithGoogle();
                    },
                    child: const IconTile(
                      imgPath: 'assets/google.png',
                    ),
                  ),
                  const IconTile(
                    imgPath: 'assets/apple.png',
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register Now',
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          AuthController.authInstance.login(
              emailController.text.trim(), passwordController.text.trim());
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: const Center(
                child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
