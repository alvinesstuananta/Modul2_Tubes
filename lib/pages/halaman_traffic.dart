import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/traffic_model.dart';

class HalamanTraffic extends StatelessWidget {
  const HalamanTraffic({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status Gate Telkom University',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Pantau kemacetan dan pintu masuk secara real-time.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Consumer<TrafficModel>(
          builder: (context, traffic, child) {
            return Column(
              children: traffic.statusGate.entries.map((entry) {
                final isMacet =
                    entry.value == 'Padat' || entry.value == 'Padat Merayap';
                return Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.door_sliding,
                      color: isMacet ? Colors.amber : Colors.green,
                    ),
                    title: Text(entry.key),
                    subtitle: Text('Status: ${entry.value}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        final statusBaru = isMacet ? 'Lancar' : 'Padat';
                        context.read<TrafficModel>().ubahStatusGate(
                          entry.key,
                          statusBaru,
                        );
                      },
                      child: Text(isMacet ? 'Ubah Lancar' : 'Laporkan Padat'),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
