import 'package:flutter/material.dart';
import 'app/view/app.dart';
import 'bootstrap.dart';
import 'database/hive_service.dart';
import 'database/shared_preferences_service.dart';
import 'injector/injector.dart';

void main() async {
  await setup();
  await bootstrap(() => const App());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.init();
  await Injector.instance.allReady();
  await SharedPreferencesService.init();
  await HiveService.init();
  // await dotenv.load();
}
