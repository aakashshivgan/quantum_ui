import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final bool obsecure;
  const MyTextField(
      {super.key,
      required this.label,
      required this.hint,
      required this.icon,
      required this.controller,
      required this.obsecure});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.090,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            suffixIcon: icon,
            suffixIconColor: Colors.red,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ]),
    );
  }
}
