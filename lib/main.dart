import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'services/progress_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final ProgressService progressService = ProgressService();
  await progressService.init();

  runApp(DockFlowLearnApp(progressService: progressService));
}
