import 'package:flutter/material.dart';

import '../models/docker_command.dart';
import '../widgets/app_card.dart';

class CommandDetailScreen extends StatelessWidget {
  const CommandDetailScreen({super.key, required this.command});

  final DockerCommand command;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(command.command)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  command.description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'Quand l utiliser',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(command.whenToUse),
                const SizedBox(height: 12),
                Text(
                  'Syntaxe',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.brightness == Brightness.dark
                        ? const Color(0xFF0B1220)
                        : const Color(0xFF1F2933),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    command.usage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Exemple',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.65,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    command.example,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Ce que tu dois voir',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(command.expectedResult),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
