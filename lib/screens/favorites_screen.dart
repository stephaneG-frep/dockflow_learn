import 'package:flutter/material.dart';

import '../data/mock_commands.dart';
import '../data/mock_concepts.dart';
import '../models/docker_command.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';
import 'command_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.progressService,
    required this.onNavigateToScreen,
  });

  final ProgressService progressService;
  final ValueChanged<int> onNavigateToScreen;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: progressService.progressNotifier,
      builder: (context, progress, _) {
        final favoriteConcepts = mockDockerConcepts
            .where((item) => progress.favoriteConceptIds.contains(item.id))
            .toList();
        final favoriteCommands = mockDockerCommands
            .where((item) => progress.favoriteCommandIds.contains(item.id))
            .toList();

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: <Widget>[
            AppCard(
              child: Text(
                'Tu as ${favoriteConcepts.length} concept(s) et ${favoriteCommands.length} commande(s) en favoris.',
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Concepts favoris',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            if (favoriteConcepts.isEmpty)
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Aucun concept en favori pour le moment.'),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () => onNavigateToScreen(5),
                      icon: const Icon(Icons.layers_rounded),
                      label: const Text('Parcourir les concepts'),
                    ),
                  ],
                ),
              ),
            ...favoriteConcepts.map((concept) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppCard(
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.favorite_rounded,
                        color: Color(0xFFE11D48),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              concept.title,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 3),
                            Text(concept.summary),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10),
            Text(
              'Commandes favorites',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            if (favoriteCommands.isEmpty)
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Aucune commande en favori pour le moment.'),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () => onNavigateToScreen(6),
                      icon: const Icon(Icons.terminal_rounded),
                      label: const Text('Parcourir les commandes'),
                    ),
                  ],
                ),
              ),
            ...favoriteCommands.map((DockerCommand command) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AppCard(
                  onTap: () {
                    progressService.markCommandViewed(command.id);
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => CommandDetailScreen(command: command),
                      ),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.star_rounded, color: Color(0xFFD97706)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              command.command,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 3),
                            Text(command.whenToUse),
                          ],
                        ),
                      ),
                      const Icon(Icons.open_in_new_rounded, size: 18),
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
