import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';

void main() {
  runApp(const AplikasiTelUControl());
}

class AplikasiTelUControl extends StatelessWidget {
  const AplikasiTelUControl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tel-U Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.red, useMaterial3: true),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.daftarRoute(),
      onGenerateRoute: AppRoutes.bentukRoute,
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}
