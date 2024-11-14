import 'package:demo_clean_architecture/core/di/configure_dependencies.dart';
import 'package:demo_clean_architecture/feature/color/presentation/page/color_page.dart';
import 'package:demo_clean_architecture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration tests', () {
    testWidgets('test', (widgetTester) async {
      final testKey =UniqueKey();

      configureDependencies();

      await widgetTester.pumpWidget(MainApp(key: testKey,));

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.byType(ColorPage), findsOneWidget);
    });
  });
}