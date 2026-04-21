import 'package:flutter/material.dart';

import '../data/mock_learning_modules.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({
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
        final int completedCount = progress.completedLearningModuleIds.length;
        final int total = mockLearningModules.length;

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: <Widget>[
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Parcours recommande (libre)',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Aucun module n est verrouille. Tu peux tout ouvrir directement. Les coches servent uniquement a suivre ta progression.',
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: total == 0 ? 0 : completedCount / total,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  const SizedBox(height: 8),
                  Text('Modules termines: $completedCount / $total'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ...mockLearningModules.map((module) {
              final bool done = progress.completedLearningModuleIds.contains(
                module.id,
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
                              module.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Icon(
                            done
                                ? Icons.check_circle_rounded
                                : Icons.radio_button_unchecked_rounded,
                            color: done
                                ? const Color(0xFF15803D)
                                : Theme.of(context).colorScheme.outline,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(module.description),
                      const SizedBox(height: 8),
                      Text('Temps estime: ${module.estimatedMinutes} min'),
                      const SizedBox(height: 8),
                      ...module.outcomes.map(
                        (outcome) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(Icons.done_rounded, size: 16),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(outcome)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: <Widget>[
                          ElevatedButton.icon(
                            onPressed: () =>
                                onNavigateToScreen(module.targetScreenIndex),
                            icon: const Icon(Icons.play_arrow_rounded),
                            label: const Text('Ouvrir le module'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => progressService
                                .toggleLearningModuleCompleted(module.id),
                            icon: Icon(
                              done
                                  ? Icons.undo_rounded
                                  : Icons.check_circle_outline_rounded,
                            ),
                            label: Text(
                              done ? 'Annuler la coche' : 'Marquer fini',
                            ),
                          ),
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
