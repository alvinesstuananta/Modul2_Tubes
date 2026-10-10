import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/lost_found_model.dart';

class HalamanDetailBarang extends StatefulWidget {
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
  State<HalamanDetailBarang> createState() => _HalamanDetailBarangState();
}

class _HalamanDetailBarangState extends State<HalamanDetailBarang> {
  bool _isClaiming = false; // State lokal

  void _klaimBarang() async {
    setState(() {
      _isClaiming = true;
    });

    // 1. Update state di Provider
    context.read<LostFoundModel>().klaimBarang(widget.namaBarang);

    // 2. Delay simulasi
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    setState(() {
      _isClaiming = false;
    });

    Navigator.pop(
      context,
      'Barang "${widget.namaBarang}" berhasil diklaim dan dihapus dari daftar temuan.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.namaBarang)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.namaBarang,
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
                widget.lokasi,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today, color: Colors.red),
              title: const Text('Tanggal'),
              subtitle: Text(
                widget.tanggal,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Deskripsi Barang:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(widget.deskripsi),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: _isClaiming ? null : _klaimBarang,
              child: _isClaiming
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Klaim Barang Ini'),
            ),
          ],
        ),
      ),
    );
  }
}
