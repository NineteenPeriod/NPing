import 'package:flutter/material.dart';

class SidebarComponent extends StatelessWidget {
  const SidebarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Selecciona un sitio",
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }
}
