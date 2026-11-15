import 'package:flutter/material.dart';
import 'server_status_card.dart';
import 'graph_card.dart';

void main() {
  runApp(const NetworkDashboardApp());
}

class NetworkDashboardApp extends StatelessWidget {
  const NetworkDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F111A),
        primaryColor: const Color(0xFF00E676),
      ),
      home: const DashboardScreen(),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atelier Responsive',
      home: Scaffold(
        body: Center(
          child: ServerStatusCard(), // Ou votre écran principal
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network\nServer Hub - Status Overview', style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            ServerStatusCard(),
            SizedBox(height: 16),
            CpuRamGraphCard(),
          ],
        ),
      ),
    );
  }
}