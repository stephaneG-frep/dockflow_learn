import 'package:flutter/material.dart';

import '../data/mock_challenges.dart';
import '../data/mock_commands.dart';
import '../data/mock_concepts.dart';
import '../data/mock_learning_modules.dart';
import '../data/mock_quiz.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key, required this.progressService});

  final ProgressService progressService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: progressService.progressNotifier,
      builder: (context, progress, _) {
        final int conceptsDone = progress.completedConceptIds.length;
        final int commandsSeen = progress.viewedCommandIds.length;
        final int challengesDone = progress.completedChallengeIds.length;
        final int modulesDone = progress.completedLearningModuleIds.length;

        final List<_Achievement> achievements = <_Achievement>[
          _Achievement(
            label: 'Premier concept',
            unlocked: conceptsDone >= 1,
            description: 'Terminer au moins 1 concept.',
          ),
          _Achievement(
            label: 'Tour de commandes',
            unlocked: commandsSeen >= 4,
            description: 'Consulter 4 commandes Docker.',
          ),
          _Achievement(
            label: 'Quiz solide',
            unlocked: progress.bestQuizScore >= 4,
            description: 'Obtenir 4/5 ou plus au quiz.',
          ),
          _Achievement(
            label: 'Pratique active',
            unlocked: challengesDone >= 2,
            description: 'Completer 2 defis pratiques.',
          ),
          _Achievement(
            label: 'Parcours termine',
            unlocked: modulesDone == mockLearningModules.length,
            description: 'Cocher tous les modules du parcours.',
          ),
        ];

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: <Widget>[
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tableau de progression',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _StatLine(
                    label: 'Concepts compris',
                    value: '$conceptsDone/${mockDockerConcepts.length}',
                  ),
                  _StatLine(
                    label: 'Commandes consultees',
                    value: '$commandsSeen/${mockDockerCommands.length}',
                  ),
                  _StatLine(
                    label: 'Defis termines',
                    value: '$challengesDone/${mockPracticeChallenges.length}',
                  ),
                  _StatLine(
                    label: 'Quiz termines',
                    value: '${progress.completedQuizCount}',
                  ),
                  _StatLine(
                    label: 'Meilleur quiz',
                    value:
                        '${progress.bestQuizScore}/${mockQuizQuestions.length}',
                  ),
                  _StatLine(
                    label: 'Modules parcours',
                    value: '$modulesDone/${mockLearningModules.length}',
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
                    'Badges',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...achievements.map((badge) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        badge.unlocked
                            ? Icons.verified_rounded
                            : Icons.radio_button_unchecked_rounded,
                        color: badge.unlocked
                            ? const Color(0xFF15803D)
                            : Theme.of(context).colorScheme.outline,
                      ),
                      title: Text(badge.label),
                      subtitle: Text(badge.description),
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StatLine extends StatelessWidget {
  const _StatLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(label)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _Achievement {
  const _Achievement({
    required this.label,
    required this.unlocked,
    required this.description,
  });

  final String label;
  final bool unlocked;
  final String description;
}
