import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 182, 128, 128),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: RichText(
                    text: const TextSpan(
                        text: 'Social',
                        style: TextStyle(fontSize: 20),
                        children: [
                      TextSpan(text: 'X', style: TextStyle(fontSize: 25))
                    ])),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: const TabBar(
                  tabs: [
                    Tab(child: Text('SignIn')),
                    Tab(
                      child: Text('SignUp'),
                    )
                  ],
                  labelColor: Color.fromRGBO(238, 248, 254, 1),
                  unselectedLabelColor: Color.fromRGBO(123, 124, 124, 1),
                  indicator: ShapeDecoration(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)))),
                ),
              ),
            ],
          )),
    );
  }
}
