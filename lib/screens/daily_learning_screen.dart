import 'package:flutter/material.dart';

import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';

class DailyLearningScreen extends StatelessWidget {
  const DailyLearningScreen({
    super.key,
    required this.progressService,
    required this.onNavigateToScreen,
  });

  final ProgressService progressService;
  final ValueChanged<int> onNavigateToScreen;

  String _dayKey(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '${date.year}-$m-$d';
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final todayKey = _dayKey(now);

    return ValueListenableBuilder<UserProgress>(
      valueListenable: progressService.progressNotifier,
      builder: (context, progress, _) {
        final int todayCount = progress.dailyActivityCounts[todayKey] ?? 0;
        final int goal = progress.dailyGoalTarget;
        final double ratio = goal == 0 ? 0 : (todayCount / goal).clamp(0, 1);
        final bool reached = todayCount >= goal;

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: <Widget>[
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Objectif quotidien',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Aujourd hui: $todayCount action(s) / objectif $goal'),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: ratio,
                    minHeight: 9,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    reached
                        ? 'Bravo, objectif atteint aujourd hui.'
                        : 'Continue, tu es bien lance.',
                    style: TextStyle(
                      color: reached
                          ? const Color(0xFF15803D)
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
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
                    'Regler mon objectif par jour',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Slider(
                    min: 1,
                    max: 10,
                    divisions: 9,
                    value: goal.toDouble().clamp(1, 10),
                    label: '$goal',
                    onChanged: (value) =>
                        progressService.setDailyGoalTarget(value.round()),
                  ),
                  Text('Objectif actuel: $goal action(s) / jour'),
                  const SizedBox(height: 8),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Rappel interne actif'),
                    subtitle: const Text(
                      'Affiche un rappel dans l app si objectif non atteint.',
                    ),
                    value: progress.remindersEnabled,
                    onChanged: (value) =>
                        progressService.setRemindersEnabled(value),
                  ),
                ],
              ),
            ),
            if (progress.remindersEnabled && !reached) ...<Widget>[
              const SizedBox(height: 12),
              const AppCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.notifications_active_rounded),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Rappel: fais une petite session maintenant (ex: 1 concept + 1 commande) pour avancer regulierement.',
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Actions rapides',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () => onNavigateToScreen(5),
                        icon: const Icon(Icons.layers_rounded),
                        label: const Text('Lire 1 concept'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => onNavigateToScreen(6),
                        icon: const Icon(Icons.terminal_rounded),
                        label: const Text('Voir 1 commande'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => onNavigateToScreen(7),
                        icon: const Icon(Icons.quiz_rounded),
                        label: const Text('Faire le quiz'),
                      ),
                    ],
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
                    'Activite recente (7 jours)',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...List<Widget>.generate(7, (index) {
                    final day = now.subtract(Duration(days: index));
                    final key = _dayKey(day);
                    final count = progress.dailyActivityCounts[key] ?? 0;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 96,
                            child: Text('${day.day}/${day.month}/${day.year}'),
                          ),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: (count / goal).clamp(0, 1),
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('$count'),
                        ],
                      ),
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
