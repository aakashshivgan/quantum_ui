import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final String imgPath;

  const IconTile({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        // color: Colors.grey[200],
      ),
      child: Image.asset(
        imgPath,
        height: 40,
      ),
    );
  }
}
