import 'package:about_you/app/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConfiguration {
  static void init() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    DependencyInjection.init();
  }
}