import 'package:flutter/material.dart';

class HalamanFasilitas extends StatelessWidget {
  const HalamanFasilitas({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Form Laporan Kerusakan Dibuka')),
            );
          },
          icon: const Icon(Icons.report),
          label: const Text('Laporkan Kerusakan Fasilitas'),
        ),
        const SizedBox(height: 16),
        const Card(
          child: ListTile(
            leading: Icon(Icons.ac_unit, color: Colors.orange),
            title: Text('AC Mati di Gedung Selaru'),
            subtitle: Text('Status: Dalam Perbaikan oleh Teknisi'),
          ),
        ),
      ],
    );
  }
}
