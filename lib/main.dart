import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotel_pra_hoje/src/app_configuration.dart';
import 'package:hotel_pra_hoje/src/modules/app_wdiget.dart';
import 'package:hotel_pra_hoje/src/modules/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfiguration.initialize();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWdiget(),
    ),
  );
}
