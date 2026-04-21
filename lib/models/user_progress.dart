class UserProgress {
  const UserProgress({
    required this.completedConceptIds,
    required this.viewedCommandIds,
    required this.completedChallengeIds,
    required this.bestQuizScore,
    required this.completedQuizCount,
    required this.isDarkMode,
  });

  factory UserProgress.initial() {
    return const UserProgress(
      completedConceptIds: <String>{},
      viewedCommandIds: <String>{},
      completedChallengeIds: <String>{},
      bestQuizScore: 0,
      completedQuizCount: 0,
      isDarkMode: false,
    );
  }

  factory UserProgress.fromMap(Map<String, dynamic> map) {
    return UserProgress(
      completedConceptIds: Set<String>.from(
        map['completedConceptIds'] ?? <String>[],
      ),
      viewedCommandIds: Set<String>.from(map['viewedCommandIds'] ?? <String>[]),
      completedChallengeIds: Set<String>.from(
        map['completedChallengeIds'] ?? <String>[],
      ),
      bestQuizScore: map['bestQuizScore'] as int? ?? 0,
      completedQuizCount: map['completedQuizCount'] as int? ?? 0,
      isDarkMode: map['isDarkMode'] as bool? ?? false,
    );
  }

  final Set<String> completedConceptIds;
  final Set<String> viewedCommandIds;
  final Set<String> completedChallengeIds;
  final int bestQuizScore;
  final int completedQuizCount;
  final bool isDarkMode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'completedConceptIds': completedConceptIds.toList(),
      'viewedCommandIds': viewedCommandIds.toList(),
      'completedChallengeIds': completedChallengeIds.toList(),
      'bestQuizScore': bestQuizScore,
      'completedQuizCount': completedQuizCount,
      'isDarkMode': isDarkMode,
    };
  }

  UserProgress copyWith({
    Set<String>? completedConceptIds,
    Set<String>? viewedCommandIds,
    Set<String>? completedChallengeIds,
    int? bestQuizScore,
    int? completedQuizCount,
    bool? isDarkMode,
  }) {
    return UserProgress(
      completedConceptIds: completedConceptIds ?? this.completedConceptIds,
      viewedCommandIds: viewedCommandIds ?? this.viewedCommandIds,
      completedChallengeIds:
          completedChallengeIds ?? this.completedChallengeIds,
      bestQuizScore: bestQuizScore ?? this.bestQuizScore,
      completedQuizCount: completedQuizCount ?? this.completedQuizCount,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  UserProgress withCompletedConcept(String conceptId) {
    return copyWith(
      completedConceptIds: <String>{...completedConceptIds, conceptId},
    );
  }

  UserProgress withViewedCommand(String commandId) {
    return copyWith(viewedCommandIds: <String>{...viewedCommandIds, commandId});
  }

  UserProgress withToggledChallenge(String challengeId) {
    final updated = <String>{...completedChallengeIds};
    if (updated.contains(challengeId)) {
      updated.remove(challengeId);
    } else {
      updated.add(challengeId);
    }
    return copyWith(completedChallengeIds: updated);
  }

  UserProgress withQuizScore(int latestScore) {
    return copyWith(
      bestQuizScore: latestScore > bestQuizScore ? latestScore : bestQuizScore,
      completedQuizCount: completedQuizCount + 1,
    );
  }

  UserProgress withThemeMode(bool enabled) {
    return copyWith(isDarkMode: enabled);
  }
}
