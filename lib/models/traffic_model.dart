import 'package:flutter/foundation.dart';

class TrafficModel extends ChangeNotifier {
  final Map<String, String> _statusGate = {
    'Gate Utama (Bojongsoang)': 'Lancar',
    'Gate 2 (Sukabirus)': 'Padat Merayap',
    'Gate 3 (Padasuka)': 'Lancar',
  };

  int _totalLaporanMacet = 1;

  Map<String, String> get statusGate => Map.unmodifiable(_statusGate);
  int get totalLaporanMacet => _totalLaporanMacet;

  void ubahStatusGate(String namaGate, String statusBaru) {
    _statusGate[namaGate] = statusBaru;
    if (statusBaru == 'Padat' || statusBaru == 'Macet') {
      _totalLaporanMacet++;
    }
    notifyListeners();
  }
}
