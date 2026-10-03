import 'package:flutter/material.dart';

import 'kerangka_navigasi.dart';
import '../pages/halaman_detail_barang.dart';
import '../pages/halaman_cctv.dart';
import '../pages/halaman_pengaturan.dart';
import '../pages/halaman_statistik.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailBarang = '/detail-barang';
  static const String cctv = '/cctv';
  static const String pengaturan = '/pengaturan';
  static const String statistik = '/statistik';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      cctv: (context) => const HalamanCctv(),
      pengaturan: (context) => const HalamanPengaturan(),
      statistik: (context) => const HalamanStatistik(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detailBarang) {
      final args = settings.arguments as Map<String, String>? ?? {};
      return MaterialPageRoute(
        builder: (context) => HalamanDetailBarang(
          namaBarang: args['namaBarang'] ?? 'Barang',
          lokasi: args['lokasi'] ?? 'Kawasan Tel-U',
          tanggal: args['tanggal'] ?? 'Hari ini',
          deskripsi: args['deskripsi'] ?? 'Tidak ada deskripsi.',
        ),
      );
    }
    return null;
  }

  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Route Tidak Dikenal')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 64,
                  color: Colors.orange,
                ),
                const SizedBox(height: 12),
                Text(
                  'Halaman "${settings.name}" belum tersedia atau salah ketik.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
