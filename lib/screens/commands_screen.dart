import 'package:flutter/material.dart';

import '../data/mock_commands.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';
import 'command_detail_screen.dart';

class CommandsScreen extends StatelessWidget {
  const CommandsScreen({super.key, required this.progressService});

  final ProgressService progressService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: progressService.progressNotifier,
      builder: (context, progress, _) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: <Widget>[
            const AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Commandes pour debutant',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tu n as pas besoin de retenir tout par coeur. Commence par comprendre "Quand l utiliser" puis reproduis l exemple.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            AppCard(
              child: Text(
                'Favoris commandes: ${progress.favoriteCommandIds.length}',
              ),
            ),
            const SizedBox(height: 12),
            ...mockDockerCommands.map((command) {
              final scheme = Theme.of(context).colorScheme;
              final hasViewed = progress.viewedCommandIds.contains(command.id);
              final isFavorite = progress.favoriteCommandIds.contains(
                command.id,
              );

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              command.command,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          IconButton(
                            tooltip: isFavorite
                                ? 'Retirer des favoris'
                                : 'Ajouter aux favoris',
                            onPressed: () => progressService
                                .toggleFavoriteCommand(command.id),
                            icon: Icon(
                              isFavorite
                                  ? Icons.star_rounded
                                  : Icons.star_border_rounded,
                              color: isFavorite
                                  ? const Color(0xFFD97706)
                                  : null,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: scheme.primary.withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              command.category,
                              style: TextStyle(
                                color: scheme.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(command.description),
                      const SizedBox(height: 8),
                      Text(
                        'Quand l utiliser: ${command.whenToUse}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          TextButton.icon(
                            onPressed: () {
                              progressService.markCommandViewed(command.id);
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) =>
                                      CommandDetailScreen(command: command),
                                ),
                              );
                            },
                            icon: const Icon(Icons.visibility_rounded),
                            label: const Text('Voir details'),
                          ),
                          const Spacer(),
                          if (hasViewed)
                            const Icon(Icons.check_circle, color: Colors.green),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
