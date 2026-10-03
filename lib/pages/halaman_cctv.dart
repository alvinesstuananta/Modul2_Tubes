import 'package:flutter/material.dart';

class HalamanCctv extends StatelessWidget {
  const HalamanCctv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CCTV Sekitar Kampus')),
      body: const Center(
        child: Text('Live Feed CCTV Kawasan Telkom University'),
      ),
    );
  }
}
