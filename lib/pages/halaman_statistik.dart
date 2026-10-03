import 'package:flutter/material.dart';

class HalamanStatistik extends StatelessWidget {
  const HalamanStatistik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistik Sistem (Admin)')),
      body: const Center(
        child: Text('Dashboard Statistik Pelaporan & Keamanan'),
      ),
    );
  }
}
