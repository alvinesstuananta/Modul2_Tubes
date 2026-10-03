import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class HalamanLostFound extends StatelessWidget {
  const HalamanLostFound({super.key});

  final List<Map<String, String>> _daftarBarang = const [
    {
      'namaBarang': 'Kunci Motor Honda',
      'lokasi': 'Gedung Tokong Nanas (TUCH)',
      'tanggal': '29 September 2026',
      'deskripsi':
          'Ditemukan di dekat lift lantai 2 dengan gantung kunci logo Tel-U.',
    },
    {
      'namaBarang': 'KTM Mahasiswa SIKC',
      'lokasi': 'Kantin Perpustakaan',
      'tanggal': '28 September 2026',
      'deskripsi': 'KTM atas nama Mahasiswa D4 Sistem Informasi Kota Cerdas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _daftarBarang.length,
      itemBuilder: (itemContext, index) {
        final item = _daftarBarang[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.card_giftcard, color: Colors.red),
            title: Text(
              item['namaBarang']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${item['lokasi']} • ${item['tanggal']}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final hasil = await Navigator.pushNamed(
                itemContext,
                AppRoutes.detailBarang,
                arguments: item,
              );

              if (hasil != null && itemContext.mounted) {
                ScaffoldMessenger.of(itemContext).showSnackBar(
                  SnackBar(
                    content: Text(hasil.toString()),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
