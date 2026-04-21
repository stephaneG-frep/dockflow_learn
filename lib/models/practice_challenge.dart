class PracticeChallenge {
  const PracticeChallenge({
    required this.id,
    required this.title,
    required this.goal,
    required this.difficulty,
    required this.steps,
  });

  final String id;
  final String title;
  final String goal;
  final String difficulty;
  final List<String> steps;
}
