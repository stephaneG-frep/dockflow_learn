import 'package:flutter/material.dart';

import '../data/mock_challenges.dart';
import '../data/mock_concepts.dart';
import '../data/mock_quiz.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../theme/app_theme.dart';
import '../widgets/app_card.dart';
import '../widgets/menu_tile_card.dart';
import '../widgets/progress_stat_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.progressService,
    required this.onNavigateToTab,
  });

  final ProgressService progressService;
  final ValueChanged<int> onNavigateToTab;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: progressService.progressNotifier,
      builder: (context, progress, _) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: <Color>[AppTheme.dockerBlue, AppTheme.dockerDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Apprends Docker simplement',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cours rapides, commandes utiles, quiz interactifs et defis pratiques.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.92),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const AppCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.school_rounded, color: AppTheme.dockerBlue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Tu debutes completement ? Ouvre d abord "Mode d emploi", puis suis le parcours conseille. Tout est explique sans prerequis.',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Menu principal',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            MenuTileCard(
              title: 'Mode d emploi',
              subtitle: 'Commencer de zero, pas a pas.',
              icon: Icons.school_rounded,
              onTap: () => onNavigateToTab(1),
            ),
            const SizedBox(height: 10),
            MenuTileCard(
              title: 'Concepts Docker',
              subtitle: 'Images, containers, volumes, reseaux...',
              icon: Icons.layers_rounded,
              onTap: () => onNavigateToTab(2),
            ),
            const SizedBox(height: 10),
            MenuTileCard(
              title: 'Commandes Docker',
              subtitle: 'Trouve rapidement la bonne commande.',
              icon: Icons.terminal_rounded,
              onTap: () => onNavigateToTab(3),
            ),
            const SizedBox(height: 10),
            MenuTileCard(
              title: 'Quiz',
              subtitle: 'Teste ta comprehension avec un score final.',
              icon: Icons.quiz_rounded,
              onTap: () => onNavigateToTab(4),
            ),
            const SizedBox(height: 10),
            MenuTileCard(
              title: 'Defis pratiques',
              subtitle: 'Mets les mains dans le terminal.',
              icon: Icons.flag_rounded,
              onTap: () => onNavigateToTab(5),
            ),
            const SizedBox(height: 10),
            MenuTileCard(
              title: 'Glossaire',
              subtitle: 'Retrouve les termes techniques rapidement.',
              icon: Icons.menu_book_rounded,
              onTap: () => onNavigateToTab(6),
            ),
            const SizedBox(height: 18),
            Text(
              'Ta progression',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                ProgressStatChip(
                  label: 'Concepts',
                  value:
                      '${progress.completedConceptIds.length}/${mockDockerConcepts.length}',
                ),
                ProgressStatChip(
                  label: 'Defis',
                  value:
                      '${progress.completedChallengeIds.length}/${mockPracticeChallenges.length}',
                ),
                ProgressStatChip(
                  label: 'Quiz max',
                  value:
                      '${progress.bestQuizScore}/${mockQuizQuestions.length}',
                ),
                ProgressStatChip(
                  label: 'Quiz termines',
                  value: '${progress.completedQuizCount}',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AppCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.lightbulb_rounded, color: AppTheme.dockerBlue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Conseil: enchaines "Concepts > Commandes > Quiz" pour ancrer rapidement chaque notion.',
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
