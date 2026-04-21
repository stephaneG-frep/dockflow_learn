import 'package:flutter/material.dart';

import '../data/mock_challenges.dart';
import '../data/mock_commands.dart';
import '../data/mock_concepts.dart';
import '../data/mock_glossary.dart';
import '../data/mock_quiz.dart';
import '../models/docker_command.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';
import 'command_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.progressService,
    required this.onNavigateToScreen,
  });

  final ProgressService progressService;
  final ValueChanged<int> onNavigateToScreen;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  List<_SearchEntry> _buildEntries() {
    final List<_SearchEntry> all = <_SearchEntry>[
      ...mockDockerConcepts.map(
        (item) => _SearchEntry(
          title: item.title,
          subtitle: item.summary,
          type: 'Concept',
          onTap: () => widget.onNavigateToScreen(5),
        ),
      ),
      ...mockDockerCommands.map(
        (DockerCommand item) => _SearchEntry(
          title: item.command,
          subtitle: item.whenToUse,
          type: 'Commande',
          onTap: () {
            widget.progressService.markCommandViewed(item.id);
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => CommandDetailScreen(command: item),
              ),
            );
          },
        ),
      ),
      ...mockPracticeChallenges.map(
        (item) => _SearchEntry(
          title: item.title,
          subtitle: item.goal,
          type: 'Defi',
          onTap: () => widget.onNavigateToScreen(8),
        ),
      ),
      ...mockGlossaryTerms.map(
        (item) => _SearchEntry(
          title: item.term,
          subtitle: item.definition,
          type: 'Glossaire',
          onTap: () => widget.onNavigateToScreen(9),
        ),
      ),
      ...mockQuizQuestions.map(
        (item) => _SearchEntry(
          title: item.question,
          subtitle: item.explanation,
          type: 'Quiz',
          onTap: () => widget.onNavigateToScreen(7),
        ),
      ),
    ];

    final String q = _query.toLowerCase().trim();
    if (q.isEmpty) {
      return all;
    }

    return all
        .where(
          (entry) =>
              entry.title.toLowerCase().contains(q) ||
              entry.subtitle.toLowerCase().contains(q) ||
              entry.type.toLowerCase().contains(q),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<_SearchEntry> results = _buildEntries();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: <Widget>[
        const AppCard(
          child: Text(
            'Recherche globale: concepts, commandes, quiz, defis et glossaire.',
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Ex: volume, docker run, compose, logs...',
            prefixIcon: Icon(Icons.search_rounded),
          ),
        ),
        const SizedBox(height: 12),
        Text('${results.length} resultat(s)'),
        const SizedBox(height: 8),
        ...results.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AppCard(
              onTap: entry.onTap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      entry.type,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          entry.title,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          entry.subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.open_in_new_rounded, size: 18),
                ],
              ),
            ),
          );
        }),
        if (results.isEmpty)
          const AppCard(
            child: Text('Aucun resultat. Essaie un mot plus simple.'),
          ),
      ],
    );
  }
}

class _SearchEntry {
  const _SearchEntry({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String type;
  final VoidCallback onTap;
}
