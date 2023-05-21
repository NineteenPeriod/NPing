import 'package:flutter/material.dart';
import 'package:n_ping/models/sitio_model.dart';

class SitioComponent extends StatefulWidget {
  const SitioComponent({super.key, required this.sitio});
  final Sitio sitio;

  @override
  State<SitioComponent> createState() => _SitioComponentState();
}

class _SitioComponentState extends State<SitioComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.teal[100],
      child: Text(widget.sitio.name),
    );
  }
}
