// ignore_for_file: public_member_api_docs, sort_constructors_first
class ConnectionStatusModel {
  String status = "Initializing connection ... ";
  bool hasConnection = false;

  ConnectionStatusModel({
    required this.status,
    required this.hasConnection,
  });
}
