import 'package:bloc_test/bloc_test.dart';
import 'package:demo_clean_architecture/feature/color/presentation/cubit/color_cubit.dart';
import 'package:demo_clean_architecture/feature/color/presentation/page/color_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockColorCubit extends MockCubit<ColorState> implements ColorCubit {}



void main() {
  group('Color page tests:', () {

    Widget wrap({required Widget child}) {
      return MaterialApp(home: child,);
    }
    testWidgets('build', (widgetTester) async {
      final testKey =UniqueKey();

      final ColorCubit cubit = MockColorCubit();

      when(() => cubit.state).thenReturn(ColorCurrentState(color: Colors.black));

      GetIt.I.registerFactory(() => cubit);

      final testWiget = wrap(child: ColorPage(key: testKey,));

      await widgetTester.pumpWidget(testWiget);

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.byType(ColorPage), findsOneWidget);
      
    });
  });

}