import 'package:flutter/material.dart';

import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.progressService});

  final ProgressService progressService;

  Future<void> _confirmReset(BuildContext context) async {
    final bool? accepted = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reinitialiser la progression ?'),
          content: const Text(
            'Cette action supprime les concepts coches, favoris, score quiz, modules et defis termines.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Reinitialiser'),
            ),
          ],
        );
      },
    );

    if (accepted == true) {
      await progressService.resetLearningProgress(keepDarkMode: true);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Progression reinitialisee.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: progressService.progressNotifier,
      builder: (context, progress, _) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: <Widget>[
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Preferences',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Mode sombre'),
                    subtitle: const Text(
                      'Interface foncee pour travailler le soir.',
                    ),
                    value: progress.isDarkMode,
                    onChanged: (value) => progressService.setDarkMode(value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Actions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => _confirmReset(context),
                      icon: const Icon(Icons.restart_alt_rounded),
                      label: const Text('Reinitialiser la progression'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await progressService.setOnboardingSeen(false);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Onboarding reactiver. Reouvre l app pour le revoir.',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.school_rounded),
                      label: const Text('Revoir l onboarding'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
