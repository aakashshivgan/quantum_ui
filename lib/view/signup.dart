import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:quantum_ui/controller/firebase_auth.dart';

import '../widgets/textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  PhoneCountryData? _initialCountryData;
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Create an Account',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 42),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: nameController,
                obsecure: false,
                label: 'Name',
                hint: 'JohnDoe',
                icon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: emailController,
                obsecure: false,
                label: 'Email',
                hint: 'JohnDoe@gmail.com',
                icon: const Icon(Icons.mail),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Contact no',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CountryDropdown(
                      printCountryName: true,
                      initialCountryCode: 'RU',
                      onCountrySelected: (PhoneCountryData countryData) {
                        setState(() {
                          _initialCountryData = countryData;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      key: ValueKey(_initialCountryData ?? 'country'),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.call),
                        suffixIconColor: Colors.red,
                        hintText: '1528765685',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        PhoneInputFormatter(
                          allowEndlessPhone: false,
                          defaultCountryCode: _initialCountryData?.countryCode,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: passwordController,
                obsecure: true,
                label: 'Password',
                hint: '*********',
                icon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("I agree with"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'terms & condition',
                        style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0),
                      ))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account?"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign In!',
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
          AuthController.authInstance.register(
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
              'REGISTER',
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
