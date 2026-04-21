import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_progress.dart';

class ProgressService {
  static const String _boxName = 'dockflow_progress_box';
  static const String _key = 'dockflow_progress';

  final ValueNotifier<UserProgress> progressNotifier =
      ValueNotifier<UserProgress>(UserProgress.initial());

  late final Box<dynamic> _box;
  String get _todayKey {
    final now = DateTime.now();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    return '${now.year}-$month-$day';
  }

  Future<void> init() async {
    _box = await Hive.openBox<dynamic>(_boxName);
    final raw = _box.get(_key);
    if (raw is Map) {
      progressNotifier.value = UserProgress.fromMap(
        Map<String, dynamic>.from(raw),
      );
    } else {
      await _save(progressNotifier.value);
    }
  }

  Future<void> markConceptCompleted(String conceptId) async {
    final current = progressNotifier.value;
    if (current.completedConceptIds.contains(conceptId)) {
      return;
    }
    final updated = current
        .withCompletedConcept(conceptId)
        .withRegisteredAction(_todayKey);
    await _save(updated);
  }

  Future<void> markCommandViewed(String commandId) async {
    final current = progressNotifier.value;
    if (current.viewedCommandIds.contains(commandId)) {
      return;
    }
    final updated = current
        .withViewedCommand(commandId)
        .withRegisteredAction(_todayKey);
    await _save(updated);
  }

  Future<void> toggleChallengeCompleted(String challengeId) async {
    final current = progressNotifier.value;
    final bool wasCompleted = current.completedChallengeIds.contains(
      challengeId,
    );
    var updated = current.withToggledChallenge(challengeId);
    if (!wasCompleted) {
      updated = updated.withRegisteredAction(_todayKey);
    }
    await _save(updated);
  }

  Future<void> registerQuizScore(int score) async {
    final updated = progressNotifier.value
        .withQuizScore(score)
        .withRegisteredAction(_todayKey);
    await _save(updated);
  }

  Future<void> setDarkMode(bool enabled) async {
    final updated = progressNotifier.value.withThemeMode(enabled);
    await _save(updated);
  }

  Future<void> completeOnboarding() async {
    final updated = progressNotifier.value.withOnboardingCompleted();
    await _save(updated);
  }

  Future<void> setOnboardingSeen(bool seen) async {
    final updated = progressNotifier.value.withOnboardingState(seen);
    await _save(updated);
  }

  Future<void> toggleFavoriteConcept(String conceptId) async {
    final updated = progressNotifier.value.withToggledFavoriteConcept(
      conceptId,
    );
    await _save(updated);
  }

  Future<void> toggleFavoriteCommand(String commandId) async {
    final updated = progressNotifier.value.withToggledFavoriteCommand(
      commandId,
    );
    await _save(updated);
  }

  Future<void> toggleLearningModuleCompleted(String moduleId) async {
    final current = progressNotifier.value;
    final bool wasCompleted = current.completedLearningModuleIds.contains(
      moduleId,
    );
    var updated = current.withToggledLearningModule(moduleId);
    if (!wasCompleted) {
      updated = updated.withRegisteredAction(_todayKey);
    }
    await _save(updated);
  }

  Future<void> setDailyGoalTarget(int target) async {
    final updated = progressNotifier.value.withDailyGoalTarget(target);
    await _save(updated);
  }

  Future<void> setRemindersEnabled(bool enabled) async {
    final updated = progressNotifier.value.withRemindersEnabled(enabled);
    await _save(updated);
  }

  Future<void> resetLearningProgress({bool keepDarkMode = true}) async {
    final updated = progressNotifier.value.resetLearningData(
      keepDarkMode: keepDarkMode,
    );
    await _save(updated);
  }

  Future<void> _save(UserProgress progress) async {
    progressNotifier.value = progress;
    await _box.put(_key, progress.toMap());
  }

  void dispose() {
    progressNotifier.dispose();
  }
}
