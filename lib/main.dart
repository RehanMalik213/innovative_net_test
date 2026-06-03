import 'package:flutter/material.dart';
import 'package:innovative_net_test/app.dart';
import 'package:innovative_net_test/core/local_storage/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

Future<void> init() async {
  await AppPreferences.instance.init();
}
