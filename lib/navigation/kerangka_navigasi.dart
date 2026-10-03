import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(_judul[_indeksTerpilih]),
        elevation: 2,
      ),
      drawer: _buatDrawer(),
      body: layarLebar ? _tataLetakLebar() : _halaman[_indeksTerpilih],
      bottomNavigationBar: layarLebar ? null : _buatBilahBawah(),
    );
  }

  Widget _buatBilahBawah() {
    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.traffic_outlined),
          selectedIcon: Icon(Icons.traffic),
          label: 'Lalu Lintas',
        ),
        NavigationDestination(
          icon: Icon(Icons.find_in_page_outlined),
          selectedIcon: Icon(Icons.find_in_page),
          label: 'Lost & Found',
        ),
        NavigationDestination(
          icon: Icon(Icons.build_outlined),
          selectedIcon: Icon(Icons.build),
          label: 'Fasilitas',
        ),
      ],
    );
  }

  Widget _tataLetakLebar() {
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
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.traffic_outlined),
              selectedIcon: Icon(Icons.traffic),
              label: Text('Lalu Lintas'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.find_in_page_outlined),
              selectedIcon: Icon(Icons.find_in_page),
              label: Text('Lost & Found'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.build_outlined),
              selectedIcon: Icon(Icons.build),
              label: Text('Fasilitas'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: _halaman[_indeksTerpilih]),
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
        ListTile(
          leading: const Icon(Icons.bug_report, color: Colors.orange),
          title: const Text('Uji Route Salah'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/halaman-salah');
          },
        ),
      ],
    );
  }
}