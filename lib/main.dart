import 'package:flutter/material.dart';
import 'package:quantum_ui/constant/constant.dart';
import 'package:quantum_ui/controller/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:quantum_ui/view/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quantum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Center(child: CircularProgressIndicator())
      home: const Auth(),
    );
  }
}
