import 'package:flutter/material.dart';
import 'package:n_ping/components/header_component.dart';
import 'package:n_ping/providers/site_provider.dart';
import 'package:n_ping/screens/dashboard_components/grid_component.dart';
import 'package:n_ping/screens/dashboard_components/sidebar_component.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    SiteProvider siteProvider = Provider.of<SiteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("N-Ping", style: TextStyle(fontWeight: FontWeight.w500)),
        backgroundColor: Colors.indigo[200],
      ),
      backgroundColor: const Color.fromRGBO(253, 240, 255, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Card(
                margin: const EdgeInsets.only(bottom: 8),
                elevation: 0,
                color: Colors.pinkAccent[100],
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        siteProvider.connectionStatusModel.status,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        child: const Text("Reconnect"),
                        onPressed: () {
                          siteProvider.reconnect();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: const GridComponent(),
                  ),
                ),
                Flexible(
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 8, right: 16),
                      child: const SidebarComponent()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
