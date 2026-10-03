import 'package:flutter/material.dart';

class HalamanDetailBarang extends StatelessWidget {
  const HalamanDetailBarang({
    super.key,
    required this.namaBarang,
    required this.lokasi,
    required this.tanggal,
    required this.deskripsi,
  });

  final String namaBarang;
  final String lokasi;
  final String tanggal;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(namaBarang)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaBarang,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const Divider(height: 24),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.location_on, color: Colors.red),
              title: const Text('Lokasi Ditemukan'),
              subtitle: Text(
                lokasi,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today, color: Colors.red),
              title: const Text('Tanggal'),
              subtitle: Text(
                tanggal,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Deskripsi Barang:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(deskripsi),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  'Klaim barang "$namaBarang" telah dikonfirmasi ke Pos Satpam.',
                );
              },
              child: const Text('Klaim Barang Ini'),
            ),
          ],
        ),
      ),
    );
  }
}
