// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:n_ping/models/connection_status.dart';
import 'package:postgres/postgres.dart';

import 'package:n_ping/models/sitio_model.dart';

class SiteProvider extends ChangeNotifier {
  final List<Sitio> sitios = [
    Sitio(1, 'Correo SSC', '201.140.100.249', true),
    Sitio(2, 'JC SSC', '201.140.100.137', true),
    Sitio(3, 'Atlas SSC', '201.140.100.142', true),
    Sitio(4, 'Api-p SSC', '201.140.100.130', true),
    Sitio(5, 'Api-g SSC', '201.140.100.134', true),
  ];

  late PostgreSQLConnection connection;
  ConnectionStatusModel connectionStatusModel = ConnectionStatusModel(
    hasConnection: false,
    status: "Initializing connection ... ",
  );

  SiteProvider() {
    debugPrint("INIT");
    openConnection();
  }

  void openConnection() async {
    setConnectionStatus(
      hasConnection: false,
      status: "Trying to establish connection to database ...",
    );
    try {
      connection = PostgreSQLConnection(
        dotenv.env['DATABASE_HOST']!,
        int.parse(dotenv.env['DATABASE_PORT']!),
        dotenv.env['DATABASE_NAME']!,
        username: dotenv.env['DATABASE_USER']!,
        password: dotenv.env['DATABASE_PASS']!,
      );
      await connection.open();
      setConnectionStatus(
        hasConnection: true,
        status: "Connection to database established",
      );
      debugPrint("INITIALIZED CONNECTION");
    } on PostgreSQLException {
      setConnectionStatus(
          hasConnection: false,
          status: "Error trying to establish connection to database ");
    }
  }

  void reconnect() {
    openConnection();
    notifyListeners();
  }

  void setConnectionStatus(
      {bool hasConnection = false, String status = "Initializing"}) {
    connectionStatusModel =
        ConnectionStatusModel(status: status, hasConnection: hasConnection);
    notifyListeners();
  }

  ConnectionStatusModel getConnectionStatus() {
    return connectionStatusModel;
  }
}
