import 'package:flutter_test/flutter_test.dart';
import 'package:dockflow_learn/app.dart';
import 'package:dockflow_learn/services/progress_service.dart';

void main() {
  testWidgets('DockFlow Learn affiche l ecran d accueil', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      DockFlowLearnApp(progressService: ProgressService()),
    );

    expect(find.text('DockFlow Learn'), findsOneWidget);
    expect(find.text('Menu principal'), findsOneWidget);
  });
}
