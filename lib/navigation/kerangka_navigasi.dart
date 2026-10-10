import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/traffic_model.dart';
import '../pages/halaman_traffic.dart';
import '../pages/halaman_lost_found.dart';
import '../pages/halaman_fasilitas.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    HalamanTraffic(),
    HalamanLostFound(),
    HalamanFasilitas(),
  ];

  final List<String> _judul = const [
    'Traffic & Gates',
    'Lost & Found',
    'Lapor Fasilitas',
  ];

  void _pilihTujuan(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double lebar = MediaQuery.of(context).size.width;
    final bool layarLebar = lebar >= 600;

    // Hanya membaca totalLaporanMacet agar hanya badge yang di-rebuild
    final totalMacet = context.select<TrafficModel, int>(
      (m) => m.totalLaporanMacet,
    );

    return Scaffold(
      appBar: AppBar(title: Text(_judul[_indeksTerpilih]), elevation: 2),
      drawer: _buatDrawer(),
      body: layarLebar
          ? _tataLetakLebar(totalMacet)
          : IndexedStack(index: _indeksTerpilih, children: _halaman),
      bottomNavigationBar: layarLebar ? null : _buatBilahBawah(totalMacet),
    );
  }

  Widget _buatBilahBawah(int totalMacet) {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: [
        NavigationDestination(
          icon: Badge(
            label: Text('$totalMacet'),
            isLabelVisible: totalMacet > 0,
            child: const Icon(Icons.traffic_outlined),
          ),
          selectedIcon: Badge(
            label: Text('$totalMacet'),
            isLabelVisible: totalMacet > 0,
            child: const Icon(Icons.traffic),
          ),
          label: 'Lalu Lintas',
        ),
        const NavigationDestination(
          icon: Icon(Icons.find_in_page_outlined),
          selectedIcon: Icon(Icons.find_in_page),
          label: 'Lost & Found',
        ),
        const NavigationDestination(
          icon: Icon(Icons.build_outlined),
          selectedIcon: Icon(Icons.build),
          label: 'Fasilitas',
        ),
      ],
    );
  }

  Widget _tataLetakLebar(int totalMacet) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeksTerpilih,
          onDestinationSelected: _pilihTujuan,
          extended: true,
          leading: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Icon(Icons.security, size: 36, color: Colors.red),
          ),
          destinations: [
            NavigationRailDestination(
              icon: Badge(
                label: Text('$totalMacet'),
                isLabelVisible: totalMacet > 0,
                child: const Icon(Icons.traffic_outlined),
              ),
              selectedIcon: Badge(
                label: Text('$totalMacet'),
                isLabelVisible: totalMacet > 0,
                child: const Icon(Icons.traffic),
              ),
              label: const Text('Lalu Lintas'),
            ),
            const NavigationRailDestination(
              icon: Icon(Icons.find_in_page_outlined),
              selectedIcon: Icon(Icons.find_in_page),
              label: Text('Lost & Found'),
            ),
            const NavigationRailDestination(
              icon: Icon(Icons.build_outlined),
              selectedIcon: Icon(Icons.build),
              label: Text('Fasilitas'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: IndexedStack(index: _indeksTerpilih, children: _halaman),
        ),
      ],
    );
  }

  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (indeks) {
        if (indeks < 3) {
          _pilihTujuan(indeks);
          Navigator.pop(context);
        }
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Alvin Estu Ananta'),
          accountEmail: Text('alvin@student.telkomuniversity.ac.id'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.red, size: 36),
          ),
          decoration: BoxDecoration(color: Colors.red),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.traffic_outlined),
          selectedIcon: Icon(Icons.traffic),
          label: Text('Lalu Lintas'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.find_in_page_outlined),
          selectedIcon: Icon(Icons.find_in_page),
          label: Text('Lost & Found'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.build_outlined),
          selectedIcon: Icon(Icons.build),
          label: Text('Fasilitas'),
        ),
        const Divider(indent: 28, endIndent: 28),
        ListTile(
          leading: const Icon(Icons.videocam_outlined),
          title: const Text('CCTV Sekitar'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.cctv);
          },
        ),
        ListTile(
          leading: const Icon(Icons.bar_chart),
          title: const Text('Statistik Sistem (Admin)'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.statistik);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Pengaturan'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.pengaturan);
          },
        ),
      ],
    );
  }
}
