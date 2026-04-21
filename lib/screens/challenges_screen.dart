import 'package:flutter/material.dart';

import '../data/mock_challenges.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key, required this.progressService});

  final ProgressService progressService;

  Color _difficultyColor(String difficulty) {
    switch (difficulty) {
      case 'Facile':
        return const Color(0xFF15803D);
      case 'Moyen':
        return const Color(0xFFD97706);
      default:
        return const Color(0xFFB91C1C);
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
            const AppCard(
              child: Text(
                'Ces defis servent a pratiquer doucement. Tu peux faire un seul defi puis revenir plus tard, la progression est sauvegardee.',
              ),
            ),
            const SizedBox(height: 12),
            ...mockPracticeChallenges.map((challenge) {
              final bool isDone = progress.completedChallengeIds.contains(
                challenge.id,
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
                              challenge.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _difficultyColor(
                                challenge.difficulty,
                              ).withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              challenge.difficulty,
                              style: TextStyle(
                                color: _difficultyColor(challenge.difficulty),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(challenge.goal),
                      const SizedBox(height: 10),
                      ...challenge.steps.map(
                        (step) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(Icons.checklist_rounded, size: 16),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(step)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () => progressService
                              .toggleChallengeCompleted(challenge.id),
                          icon: Icon(
                            isDone
                                ? Icons.undo_rounded
                                : Icons.task_alt_rounded,
                          ),
                          label: Text(
                            isDone ? 'Annuler completion' : 'Marquer termine',
                          ),
                        ),
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
