import 'package:flutter/material.dart';

import '../services/progress_service.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.progressService});

  final ProgressService progressService;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  static const List<_OnboardingPageData> _pages = <_OnboardingPageData>[
    _OnboardingPageData(
      title: 'Bienvenue sur DockFlow Learn',
      description:
          'Tu peux apprendre Docker a ton rythme, meme si tu pars de zero complet.',
      icon: Icons.rocket_launch_rounded,
    ),
    _OnboardingPageData(
      title: 'Apprentissage guide et progressif',
      description:
          'Concepts, commandes, quiz et defis pratiques sont structures en parcours clair.',
      icon: Icons.route_rounded,
    ),
    _OnboardingPageData(
      title: 'Aucune section n est verrouillee',
      description:
          'Tu restes libre de naviguer partout. Le parcours te recommande juste un ordre efficace.',
      icon: Icons.lock_open_rounded,
    ),
  ];

  Future<void> _finishOnboarding() async {
    await widget.progressService.completeOnboarding();
  }

  void _next() {
    if (_pageIndex == _pages.length - 1) {
      _finishOnboarding();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLast = _pageIndex == _pages.length - 1;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[AppTheme.dockerBlue, AppTheme.dockerDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finishOnboarding,
                  child: const Text(
                    'Passer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 42,
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.2,
                            ),
                            child: Icon(
                              page.icon,
                              size: 42,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            page.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            page.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.92),
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (index) {
                  final bool active = index == _pageIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: active ? 24 : 8,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: active ? 1 : 0.5),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.dockerDark,
                    ),
                    onPressed: _next,
                    icon: Icon(
                      isLast
                          ? Icons.check_circle_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      isLast ? 'Commencer l apprentissage' : 'Suivant',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  const _OnboardingPageData({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
