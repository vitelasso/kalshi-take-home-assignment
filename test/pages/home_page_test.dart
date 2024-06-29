import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/blocs/finantial_health_bloc.dart';
import 'package:kalshi_tha/pages/home_page.dart';

const appTitleTestKey = Key('home_page_app_title');
const finantialTestCardTitleKey = Key('finantial_test_card_title');
const annualIncomeControllerInputKey = Key('annualIncomeController_input');
const monthlyCostsControllerInputKey = Key('monthlyCostsController_input');

void main() {
  group('HomePage renders correct widgets when', () {
    testWidgets(
      'first opened',
      (tester) async {
        await tester.pumpWidget(
          BlocProvider(
            create: (context) => FinantialHealthBloc(),
            child: const MaterialApp(home: HomePage()),
          ),
        );

        expect(find.byKey(appTitleTestKey), findsOneWidget);
        expect(find.byKey(finantialTestCardTitleKey), findsOneWidget);
        expect(find.byKey(annualIncomeControllerInputKey), findsOneWidget);
        expect(find.byKey(monthlyCostsControllerInputKey), findsOneWidget);
      },
    );

    testWidgets(
      'input are entered with text instead of numbers',
      (tester) async {
        await tester.pumpWidget(
          BlocProvider(
            create: (context) => FinantialHealthBloc(),
            child: const MaterialApp(home: HomePage()),
          ),
        );

        final textField1 = find.byKey(annualIncomeControllerInputKey);
        final textField2 = find.byKey(monthlyCostsControllerInputKey);
        // Enter text into the TextField
        await tester.enterText(textField1, 'Hello, World!');
        await tester.enterText(textField2, 'Hello, World!');

        // Verify that the TextField has the text you entered
        expect(find.text(''), findsExactly(2));
      },
    );
  });
}
