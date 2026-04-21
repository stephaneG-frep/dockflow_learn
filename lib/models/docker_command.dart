class DockerCommand {
  const DockerCommand({
    required this.id,
    required this.command,
    required this.description,
    required this.usage,
    required this.example,
    required this.category,
    required this.whenToUse,
    required this.expectedResult,
  });

  final String id;
  final String command;
  final String description;
  final String usage;
  final String example;
  final String category;
  final String whenToUse;
  final String expectedResult;
}
