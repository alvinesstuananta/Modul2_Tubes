import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/lost_found_model.dart';
import '../navigation/app_routes.dart';

class HalamanLostFound extends StatelessWidget {
  const HalamanLostFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LostFoundModel>(
      builder: (context, lostFound, child) {
        if (lostFound.daftarBarang.isEmpty) {
          return const Center(
            child: Text('Belum ada laporan barang hilang/temuan.'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: lostFound.daftarBarang.length,
          itemBuilder: (itemContext, index) {
            final item = lostFound.daftarBarang[index];
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
      },
    );
  }
}
