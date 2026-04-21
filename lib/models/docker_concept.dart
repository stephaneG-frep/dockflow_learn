class DockerConcept {
  const DockerConcept({
    required this.id,
    required this.title,
    required this.summary,
    required this.description,
    required this.keyPoints,
    required this.beginnerAnalogy,
    required this.whenToUse,
  });

  final String id;
  final String title;
  final String summary;
  final String description;
  final List<String> keyPoints;
  final String beginnerAnalogy;
  final String whenToUse;
}
