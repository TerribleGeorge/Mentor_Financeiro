import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mentor_financeiro/services/subscription_provider.dart';
import 'package:mentor_financeiro/widgets/premium_wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('PremiumWrapper bloqueia quando não é premium', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SubscriptionProvider()
              ..updatePremiumStatus(false),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: PremiumWrapper(
              feature: 'Teste',
              child: SizedBox(width: 200, height: 100, child: Text('Secreto')),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Premium'), findsOneWidget);
    expect(find.text('Secreto'), findsOneWidget);
  });

  testWidgets('PremiumWrapper mostra filho quando é premium', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SubscriptionProvider()
              ..updatePremiumStatus(true),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: PremiumWrapper(
              feature: 'Teste',
              child: Text('Liberado'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Liberado'), findsOneWidget);
    expect(find.text('Premium'), findsNothing);
  });
}
