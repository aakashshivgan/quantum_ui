import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quantum_ui/view/signin.dart';
import 'package:quantum_ui/view/signup.dart';

import '../widgets/tabbar.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[const SignInPage(), const SignUpPage()];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height * 0.13;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: PreferredSize(
          preferredSize: Size(w, h),
          child: const MyTabBar(),
        ),
        body: TabBarView(children: pages),
      ),
    );
  }
}
