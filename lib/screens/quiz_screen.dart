import 'package:flutter/material.dart';

import '../data/mock_quiz.dart';
import '../models/quiz_question.dart';
import '../models/user_progress.dart';
import '../services/progress_service.dart';
import '../widgets/app_card.dart';
import '../widgets/quiz_option_tile.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.progressService});

  final ProgressService progressService;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int? _selectedIndex;
  int _score = 0;
  bool _isFinished = false;

  QuizQuestion get _currentQuestion => mockQuizQuestions[_questionIndex];

  void _selectOption(int index) {
    if (_selectedIndex != null) {
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _next() async {
    if (_selectedIndex == null) {
      return;
    }

    final bool isCorrect = _selectedIndex == _currentQuestion.correctIndex;
    final int updatedScore = _score + (isCorrect ? 1 : 0);

    if (_questionIndex == mockQuizQuestions.length - 1) {
      setState(() {
        _score = updatedScore;
        _isFinished = true;
      });
      await widget.progressService.registerQuizScore(updatedScore);
      return;
    }

    setState(() {
      _score = updatedScore;
      _questionIndex += 1;
      _selectedIndex = null;
    });
  }

  void _restart() {
    setState(() {
      _questionIndex = 0;
      _selectedIndex = null;
      _score = 0;
      _isFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserProgress>(
      valueListenable: widget.progressService.progressNotifier,
      builder: (context, progress, _) {
        if (_isFinished) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              AppCard(
                child: Column(
                  children: <Widget>[
                    const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.amber,
                      size: 56,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Quiz termine',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Score: $_score / ${mockQuizQuestions.length}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Meilleur score: ${progress.bestQuizScore} / ${mockQuizQuestions.length}',
                    ),
                    const SizedBox(height: 18),
                    ElevatedButton.icon(
                      onPressed: _restart,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Recommencer le quiz'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const AppCard(
                child: Text(
                  'Si ton score est faible, ce n est pas un probleme. Revois Concepts puis Commandes, et refais le quiz.',
                ),
              ),
            ],
          );
        }

        final QuizQuestion question = _currentQuestion;
        final bool hasAnswered = _selectedIndex != null;
        final bool isCorrect = _selectedIndex == question.correctIndex;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Objectif du quiz',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ce quiz ne sert pas a te pieger. Il sert a verifier les bases et a t expliquer les notions si tu te trompes.',
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
                    'Question ${_questionIndex + 1}/${mockQuizQuestions.length}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    question.question,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  ...List<Widget>.generate(question.options.length, (
                    optionIndex,
                  ) {
                    final option = question.options[optionIndex];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: QuizOptionTile(
                        text: option,
                        isSelected: _selectedIndex == optionIndex,
                        onTap: () => _selectOption(optionIndex),
                      ),
                    );
                  }),
                  if (hasAnswered) ...<Widget>[
                    const SizedBox(height: 6),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isCorrect
                            ? const Color(0xFFE6F9EF)
                            : const Color(0xFFFDEBEC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        question.explanation,
                        style: TextStyle(
                          color: isCorrect
                              ? const Color(0xFF156B40)
                              : const Color(0xFF9C1C2D),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: hasAnswered ? _next : null,
                      child: Text(
                        _questionIndex == mockQuizQuestions.length - 1
                            ? 'Voir le score'
                            : 'Question suivante',
                      ),
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
