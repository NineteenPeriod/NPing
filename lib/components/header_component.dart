import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        title,
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
