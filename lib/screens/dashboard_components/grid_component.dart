import 'package:flutter/material.dart';
import 'package:n_ping/models/sitio_model.dart';
import 'package:n_ping/screens/dashboard_components/sitio_component.dart';

class GridComponent extends StatelessWidget {
  const GridComponent({super.key});

  static List<Sitio> sitios = [
    Sitio(1, 'Correo SSC', '201.140.100.249', true),
    Sitio(2, 'JC SSC', '201.140.100.137', true),
    Sitio(3, 'Atlas SSC', '201.140.100.142', true),
    Sitio(4, 'Api-p SSC', '201.140.100.130', true),
    Sitio(5, 'Api-g SSC', '201.140.100.134', true),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        itemCount: sitios.length,
        itemBuilder: (BuildContext context, int index) {
          return SitioComponent(sitio: sitios[index]);
        });
  }
}
