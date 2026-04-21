class UserProgress {
  const UserProgress({
    required this.completedConceptIds,
    required this.viewedCommandIds,
    required this.completedChallengeIds,
    required this.bestQuizScore,
    required this.completedQuizCount,
    required this.isDarkMode,
    required this.hasSeenOnboarding,
    required this.favoriteConceptIds,
    required this.favoriteCommandIds,
    required this.completedLearningModuleIds,
    required this.dailyGoalTarget,
    required this.remindersEnabled,
    required this.dailyActivityCounts,
  });

  factory UserProgress.initial() {
    return const UserProgress(
      completedConceptIds: <String>{},
      viewedCommandIds: <String>{},
      completedChallengeIds: <String>{},
      bestQuizScore: 0,
      completedQuizCount: 0,
      isDarkMode: false,
      hasSeenOnboarding: false,
      favoriteConceptIds: <String>{},
      favoriteCommandIds: <String>{},
      completedLearningModuleIds: <String>{},
      dailyGoalTarget: 3,
      remindersEnabled: true,
      dailyActivityCounts: <String, int>{},
    );
  }

  factory UserProgress.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> rawDailyCounts = Map<String, dynamic>.from(
      map['dailyActivityCounts'] ?? <String, dynamic>{},
    );

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
      hasSeenOnboarding: map['hasSeenOnboarding'] as bool? ?? false,
      favoriteConceptIds: Set<String>.from(
        map['favoriteConceptIds'] ?? <String>[],
      ),
      favoriteCommandIds: Set<String>.from(
        map['favoriteCommandIds'] ?? <String>[],
      ),
      completedLearningModuleIds: Set<String>.from(
        map['completedLearningModuleIds'] ?? <String>[],
      ),
      dailyGoalTarget: map['dailyGoalTarget'] as int? ?? 3,
      remindersEnabled: map['remindersEnabled'] as bool? ?? true,
      dailyActivityCounts: rawDailyCounts.map(
        (key, value) => MapEntry(key, (value as num).toInt()),
      ),
    );
  }

  final Set<String> completedConceptIds;
  final Set<String> viewedCommandIds;
  final Set<String> completedChallengeIds;
  final int bestQuizScore;
  final int completedQuizCount;
  final bool isDarkMode;
  final bool hasSeenOnboarding;
  final Set<String> favoriteConceptIds;
  final Set<String> favoriteCommandIds;
  final Set<String> completedLearningModuleIds;
  final int dailyGoalTarget;
  final bool remindersEnabled;
  final Map<String, int> dailyActivityCounts;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'completedConceptIds': completedConceptIds.toList(),
      'viewedCommandIds': viewedCommandIds.toList(),
      'completedChallengeIds': completedChallengeIds.toList(),
      'bestQuizScore': bestQuizScore,
      'completedQuizCount': completedQuizCount,
      'isDarkMode': isDarkMode,
      'hasSeenOnboarding': hasSeenOnboarding,
      'favoriteConceptIds': favoriteConceptIds.toList(),
      'favoriteCommandIds': favoriteCommandIds.toList(),
      'completedLearningModuleIds': completedLearningModuleIds.toList(),
      'dailyGoalTarget': dailyGoalTarget,
      'remindersEnabled': remindersEnabled,
      'dailyActivityCounts': dailyActivityCounts,
    };
  }

  UserProgress copyWith({
    Set<String>? completedConceptIds,
    Set<String>? viewedCommandIds,
    Set<String>? completedChallengeIds,
    int? bestQuizScore,
    int? completedQuizCount,
    bool? isDarkMode,
    bool? hasSeenOnboarding,
    Set<String>? favoriteConceptIds,
    Set<String>? favoriteCommandIds,
    Set<String>? completedLearningModuleIds,
    int? dailyGoalTarget,
    bool? remindersEnabled,
    Map<String, int>? dailyActivityCounts,
  }) {
    return UserProgress(
      completedConceptIds: completedConceptIds ?? this.completedConceptIds,
      viewedCommandIds: viewedCommandIds ?? this.viewedCommandIds,
      completedChallengeIds:
          completedChallengeIds ?? this.completedChallengeIds,
      bestQuizScore: bestQuizScore ?? this.bestQuizScore,
      completedQuizCount: completedQuizCount ?? this.completedQuizCount,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      hasSeenOnboarding: hasSeenOnboarding ?? this.hasSeenOnboarding,
      favoriteConceptIds: favoriteConceptIds ?? this.favoriteConceptIds,
      favoriteCommandIds: favoriteCommandIds ?? this.favoriteCommandIds,
      completedLearningModuleIds:
          completedLearningModuleIds ?? this.completedLearningModuleIds,
      dailyGoalTarget: dailyGoalTarget ?? this.dailyGoalTarget,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      dailyActivityCounts: dailyActivityCounts ?? this.dailyActivityCounts,
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

  UserProgress withOnboardingCompleted() {
    return copyWith(hasSeenOnboarding: true);
  }

  UserProgress withOnboardingState(bool seen) {
    return copyWith(hasSeenOnboarding: seen);
  }

  UserProgress withToggledFavoriteConcept(String conceptId) {
    final updated = <String>{...favoriteConceptIds};
    if (updated.contains(conceptId)) {
      updated.remove(conceptId);
    } else {
      updated.add(conceptId);
    }
    return copyWith(favoriteConceptIds: updated);
  }

  UserProgress withToggledFavoriteCommand(String commandId) {
    final updated = <String>{...favoriteCommandIds};
    if (updated.contains(commandId)) {
      updated.remove(commandId);
    } else {
      updated.add(commandId);
    }
    return copyWith(favoriteCommandIds: updated);
  }

  UserProgress withToggledLearningModule(String moduleId) {
    final updated = <String>{...completedLearningModuleIds};
    if (updated.contains(moduleId)) {
      updated.remove(moduleId);
    } else {
      updated.add(moduleId);
    }
    return copyWith(completedLearningModuleIds: updated);
  }

  UserProgress withDailyGoalTarget(int target) {
    return copyWith(dailyGoalTarget: target.clamp(1, 20));
  }

  UserProgress withRemindersEnabled(bool enabled) {
    return copyWith(remindersEnabled: enabled);
  }

  UserProgress withRegisteredAction(String dayKey) {
    final updated = <String, int>{...dailyActivityCounts};
    updated[dayKey] = (updated[dayKey] ?? 0) + 1;
    return copyWith(dailyActivityCounts: updated);
  }

  UserProgress resetLearningData({required bool keepDarkMode}) {
    return UserProgress(
      completedConceptIds: <String>{},
      viewedCommandIds: <String>{},
      completedChallengeIds: <String>{},
      bestQuizScore: 0,
      completedQuizCount: 0,
      isDarkMode: keepDarkMode ? isDarkMode : false,
      hasSeenOnboarding: hasSeenOnboarding,
      favoriteConceptIds: <String>{},
      favoriteCommandIds: <String>{},
      completedLearningModuleIds: <String>{},
      dailyGoalTarget: dailyGoalTarget,
      remindersEnabled: remindersEnabled,
      dailyActivityCounts: <String, int>{},
    );
  }
}
