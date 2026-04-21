import 'package:flutter/material.dart';

import '../data/mock_challenges.dart';
import '../data/mock_concepts.dart';
import '../data/mock_learning_modules.dart';
import '../data/mock_quiz.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import 'challenges_screen.dart';
import 'commands_screen.dart';
import 'concepts_screen.dart';
import 'glossary_screen.dart';
import 'guide_screen.dart';
import 'home_screen.dart';
import 'learning_path_screen.dart';
import 'quiz_screen.dart';
import 'search_screen.dart';
import 'settings_screen.dart';
import 'stats_screen.dart';

class AppShellScreen extends StatefulWidget {
  const AppShellScreen({super.key, required this.progressService});

  final ProgressService progressService;

  @override
  State<AppShellScreen> createState() => _AppShellScreenState();
}

class _AppShellScreenState extends State<AppShellScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  static const List<String> _titles = <String>[
    'DockFlow Learn',
    'Mode d emploi',
    'Parcours',
    'Concepts Docker',
    'Commandes Docker',
    'Quiz Docker',
    'Defis pratiques',
    'Glossaire',
    'Recherche',
    'Statistiques',
    'Parametres',
  ];

  @override
  void initState() {
    super.initState();
    _screens = <Widget>[
      HomeScreen(
        progressService: widget.progressService,
        onNavigateToTab: _goToScreen,
      ),
      const GuideScreen(),
      LearningPathScreen(
        progressService: widget.progressService,
        onNavigateToScreen: _goToScreen,
      ),
      ConceptsScreen(progressService: widget.progressService),
      CommandsScreen(progressService: widget.progressService),
      QuizScreen(progressService: widget.progressService),
      ChallengesScreen(progressService: widget.progressService),
      const GlossaryScreen(),
      SearchScreen(
        progressService: widget.progressService,
        onNavigateToScreen: _goToScreen,
      ),
      StatsScreen(progressService: widget.progressService),
      SettingsScreen(progressService: widget.progressService),
    ];
  }

  void _goToScreen(int index) {
    if (index == _currentIndex) {
      Navigator.of(context).maybePop();
      return;
    }

    setState(() {
      _currentIndex = index;
    });

    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: widget.progressService.progressNotifier,
      builder: (context, progress, _) {
        return Scaffold(
          appBar: AppBar(title: Text(_titles[_currentIndex])),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  margin: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'DockFlow Learn',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Application complete pour apprendre Docker de zero a autonome.',
                      ),
                      const Spacer(),
                      Text(
                        'Concepts ${progress.completedConceptIds.length}/${mockDockerConcepts.length} • Defis ${progress.completedChallengeIds.length}/${mockPracticeChallenges.length} • Quiz max ${progress.bestQuizScore}/${mockQuizQuestions.length} • Modules ${progress.completedLearningModuleIds.length}/${mockLearningModules.length}',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      _DrawerNavTile(
                        title: 'Accueil',
                        icon: Icons.home_rounded,
                        selected: _currentIndex == 0,
                        onTap: () => _goToScreen(0),
                      ),
                      _DrawerNavTile(
                        title: 'Mode d emploi',
                        icon: Icons.school_rounded,
                        selected: _currentIndex == 1,
                        onTap: () => _goToScreen(1),
                      ),
                      _DrawerNavTile(
                        title: 'Parcours recommande',
                        icon: Icons.route_rounded,
                        selected: _currentIndex == 2,
                        onTap: () => _goToScreen(2),
                      ),
                      _DrawerNavTile(
                        title: 'Concepts Docker',
                        icon: Icons.layers_rounded,
                        selected: _currentIndex == 3,
                        onTap: () => _goToScreen(3),
                      ),
                      _DrawerNavTile(
                        title: 'Commandes Docker',
                        icon: Icons.terminal_rounded,
                        selected: _currentIndex == 4,
                        onTap: () => _goToScreen(4),
                      ),
                      _DrawerNavTile(
                        title: 'Quiz',
                        icon: Icons.quiz_rounded,
                        selected: _currentIndex == 5,
                        onTap: () => _goToScreen(5),
                      ),
                      _DrawerNavTile(
                        title: 'Defis pratiques',
                        icon: Icons.flag_rounded,
                        selected: _currentIndex == 6,
                        onTap: () => _goToScreen(6),
                      ),
                      _DrawerNavTile(
                        title: 'Glossaire',
                        icon: Icons.menu_book_rounded,
                        selected: _currentIndex == 7,
                        onTap: () => _goToScreen(7),
                      ),
                      _DrawerNavTile(
                        title: 'Recherche globale',
                        icon: Icons.search_rounded,
                        selected: _currentIndex == 8,
                        onTap: () => _goToScreen(8),
                      ),
                      _DrawerNavTile(
                        title: 'Statistiques',
                        icon: Icons.bar_chart_rounded,
                        selected: _currentIndex == 9,
                        onTap: () => _goToScreen(9),
                      ),
                      _DrawerNavTile(
                        title: 'Parametres',
                        icon: Icons.settings_rounded,
                        selected: _currentIndex == 10,
                        onTap: () => _goToScreen(10),
                      ),
                      const Divider(height: 24),
                      SwitchListTile.adaptive(
                        title: const Text('Mode sombre'),
                        subtitle: const Text('Sauvegarde automatique.'),
                        value: progress.isDarkMode,
                        onChanged: (value) =>
                            widget.progressService.setDarkMode(value),
                        secondary: const Icon(Icons.dark_mode_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            transitionBuilder: (child, animation) {
              final slide = Tween<Offset>(
                begin: const Offset(0.05, 0),
                end: Offset.zero,
              ).animate(animation);
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(position: slide, child: child),
              );
            },
            child: KeyedSubtree(
              key: ValueKey<int>(_currentIndex),
              child: _screens[_currentIndex],
            ),
          ),
        );
      },
    );
  }
}

class _DrawerNavTile extends StatelessWidget {
  const _DrawerNavTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: selected,
      selectedTileColor: Theme.of(
        context,
      ).colorScheme.primary.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: onTap,
    );
  }
}
