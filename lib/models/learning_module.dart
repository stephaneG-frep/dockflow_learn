class LearningModule {
  const LearningModule({
    required this.id,
    required this.title,
    required this.description,
    required this.estimatedMinutes,
    required this.targetScreenIndex,
    required this.outcomes,
  });

  final String id;
  final String title;
  final String description;
  final int estimatedMinutes;
  final int targetScreenIndex;
  final List<String> outcomes;
}
