import 'package:flutter/material.dart';

import 'models/user_progress.dart';
import 'screens/app_shell_screen.dart';
import 'services/progress_service.dart';
import 'theme/app_theme.dart';

class DockFlowLearnApp extends StatelessWidget {
  const DockFlowLearnApp({super.key, required this.progressService});

  final ProgressService progressService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: progressService.progressNotifier,
      builder: (context, progress, _) {
        return MaterialApp(
          title: 'DockFlow Learn',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: progress.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: AppShellScreen(progressService: progressService),
        );
      },
    );
  }
}
