import 'package:flutter/material.dart';

import '../data/mock_concepts.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';

class ConceptsScreen extends StatelessWidget {
  const ConceptsScreen({super.key, required this.progressService});

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
                    'Comment lire cette page si tu debutes',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lis les concepts dans l ordre. Pour chaque carte: comprends le resume, lis l analogie puis regarde "Quand l utiliser".',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            AppCard(
              child: Text(
                'Favoris concepts: ${progress.favoriteConceptIds.length}',
              ),
            ),
            const SizedBox(height: 12),
            ...mockDockerConcepts.map((concept) {
              final isCompleted = progress.completedConceptIds.contains(
                concept.id,
              );
              final isFavorite = progress.favoriteConceptIds.contains(
                concept.id,
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
                              concept.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          IconButton(
                            tooltip: isFavorite
                                ? 'Retirer des favoris'
                                : 'Ajouter aux favoris',
                            onPressed: () => progressService
                                .toggleFavoriteConcept(concept.id),
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: isFavorite
                                  ? const Color(0xFFE11D48)
                                  : null,
                            ),
                          ),
                          if (isCompleted)
                            const Icon(Icons.check_circle, color: Colors.green),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        concept.summary,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(concept.description),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Analogie simple: ${concept.beginnerAnalogy}',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Quand l utiliser: ${concept.whenToUse}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...concept.keyPoints.map(
                        (point) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(Icons.circle, size: 8),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(point)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: isCompleted
                              ? null
                              : () => progressService.markConceptCompleted(
                                  concept.id,
                                ),
                          icon: Icon(
                            isCompleted
                                ? Icons.done_all_rounded
                                : Icons.check_rounded,
                          ),
                          label: Text(
                            isCompleted
                                ? 'Deja compris'
                                : 'Marquer comme compris',
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
