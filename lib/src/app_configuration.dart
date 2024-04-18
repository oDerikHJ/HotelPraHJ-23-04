import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

late final String kBaseUrl;

class AppConfiguration {
  static Future<void> initialize() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (kDebugMode) {
      kBaseUrl = 'endpoint-local && homologação';
    } else {
      kBaseUrl = 'endpoint-produção';
    }
  }
}
