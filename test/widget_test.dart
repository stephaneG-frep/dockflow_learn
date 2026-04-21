import 'package:flutter_test/flutter_test.dart';
import 'package:dockflow_learn/app.dart';
import 'package:dockflow_learn/services/progress_service.dart';

void main() {
  testWidgets('DockFlow Learn affiche l onboarding au premier lancement', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      DockFlowLearnApp(progressService: ProgressService()),
    );

    expect(find.text('Bienvenue sur DockFlow Learn'), findsOneWidget);
  });
}
