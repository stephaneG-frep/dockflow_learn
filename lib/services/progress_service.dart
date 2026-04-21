import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_progress.dart';

class ProgressService {
  static const String _boxName = 'dockflow_progress_box';
  static const String _key = 'dockflow_progress';

  final ValueNotifier<UserProgress> progressNotifier =
      ValueNotifier<UserProgress>(UserProgress.initial());

  late final Box<dynamic> _box;

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
    final updated = progressNotifier.value.withCompletedConcept(conceptId);
    await _save(updated);
  }

  Future<void> markCommandViewed(String commandId) async {
    final updated = progressNotifier.value.withViewedCommand(commandId);
    await _save(updated);
  }

  Future<void> toggleChallengeCompleted(String challengeId) async {
    final updated = progressNotifier.value.withToggledChallenge(challengeId);
    await _save(updated);
  }

  Future<void> registerQuizScore(int score) async {
    final updated = progressNotifier.value.withQuizScore(score);
    await _save(updated);
  }

  Future<void> setDarkMode(bool enabled) async {
    final updated = progressNotifier.value.withThemeMode(enabled);
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
