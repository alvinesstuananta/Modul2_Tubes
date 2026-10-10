import 'package:flutter/foundation.dart';

class LostFoundModel extends ChangeNotifier {
  final List<Map<String, String>> _daftarBarang = [
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

  List<Map<String, String>> get daftarBarang =>
      List.unmodifiable(_daftarBarang);
  int get totalBarang => _daftarBarang.length;

  void klaimBarang(String namaBarang) {
    _daftarBarang.removeWhere((item) => item['namaBarang'] == namaBarang);
    notifyListeners();
  }
}
