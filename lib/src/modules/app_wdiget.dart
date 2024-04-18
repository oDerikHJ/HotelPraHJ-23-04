import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWdiget extends StatelessWidget {
  const AppWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hotel pra hoje',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
